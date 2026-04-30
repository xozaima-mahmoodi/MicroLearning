module Api
  module V1
    class BaseController < ApplicationController
      around_action :switch_locale

      rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

      private

      # Locale precedence:
      #   1. ?locale=xx query param (handy for debugging in a browser)
      #   2. X-Locale header (the frontend sets this explicitly)
      #   3. Accept-Language header (first matching tag)
      # Falls back to I18n.default_locale (fa) when nothing matches.
      def switch_locale(&action)
        chosen = resolved_locale
        I18n.with_locale(chosen) do
          Mobility.with_locale(chosen, &action)
        end
      end

      def resolved_locale
        candidates = [
          params[:locale],
          request.headers["X-Locale"],
          *parse_accept_language(request.headers["Accept-Language"])
        ]

        available = I18n.available_locales.map(&:to_s)
        match = candidates.compact.map(&:to_s).find { |c| available.include?(c) }
        (match || I18n.default_locale).to_sym
      end

      # Returns the language tags from an Accept-Language header in priority
      # order (we ignore q-values; the first matching tag wins, which is
      # accurate enough for a two-language app).
      def parse_accept_language(header)
        return [] if header.blank?
        header.split(",").map { |part| part.split(";").first&.strip&.split("-")&.first }.compact
      end

      def render_not_found(error)
        render json: { errors: [ { status: "404", title: I18n.t("api.errors.not_found"), detail: error.message } ] },
               status: :not_found
      end
    end
  end
end
