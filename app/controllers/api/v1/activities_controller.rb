module Api
  module V1
    class ActivitiesController < BaseController
      DEFAULT_RANGE_DAYS = 182 # ~6 months

      # GET /api/v1/activities?from=YYYY-MM-DD&to=YYYY-MM-DD
      # Headers: X-Device-Id (required)
      def index
        return render_missing_device unless device_id

        from = parse_date(params[:from]) || (Date.current - DEFAULT_RANGE_DAYS)
        to   = parse_date(params[:to])   || Date.current

        # Group by date so the client gets a flat per-day count.
        per_day = UserActivity
                  .for_user(device_id)
                  .between(from, to)
                  .group(:activity_date)
                  .count

        # All distinct activity dates for this user — needed to compute the
        # streak across the entire history, not just the visible range.
        all_dates = UserActivity.for_user(device_id).distinct.pluck(:activity_date)

        render json: {
          range: { from: from.iso8601, to: to.iso8601 },
          days: per_day.map { |date, count| { date: date.iso8601, count: count } },
          total_concepts: UserActivity.for_user(device_id).distinct.count(:concept_id),
          longest_streak: longest_streak(all_dates),
          current_streak: current_streak(all_dates)
        }
      end

      # POST /api/v1/activities
      # Body: { concept_slug: "..." }
      # Headers: X-Device-Id (required)
      def create
        return render_missing_device unless device_id

        concept = Concept.friendly.find(params[:concept_slug])
        # find_or_create_by guards the unique (user_id, concept_id, date)
        # index — re-marking the same concept on the same day is a no-op.
        UserActivity.find_or_create_by!(
          user_id: device_id,
          concept: concept,
          activity_date: Date.current
        )
        render json: { ok: true, date: Date.current.iso8601 }, status: :created
      end

      private

      def device_id
        @device_id ||= request.headers["X-Device-Id"].presence
      end

      def render_missing_device
        render json: { errors: [ { status: "400", title: I18n.t("api.errors.missing_device") } ] },
               status: :bad_request
      end

      def parse_date(raw)
        return nil if raw.blank?
        Date.parse(raw)
      rescue ArgumentError
        nil
      end

      # Longest run of consecutive days that include activity.
      def longest_streak(dates)
        return 0 if dates.empty?
        sorted = dates.uniq.sort
        best = 1
        run = 1
        sorted.each_cons(2) do |a, b|
          run = (b - a == 1) ? run + 1 : 1
          best = run if run > best
        end
        best
      end

      # Streak ending today (or yesterday — keeps the streak alive across the
      # midnight rollover until the user has had a chance to study).
      def current_streak(dates)
        return 0 if dates.empty?
        set = dates.to_set
        anchor = set.include?(Date.current) ? Date.current : Date.current - 1
        return 0 unless set.include?(anchor)
        run = 0
        d = anchor
        while set.include?(d)
          run += 1
          d -= 1
        end
        run
      end
    end
  end
end
