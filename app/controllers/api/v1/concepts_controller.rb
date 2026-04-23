module Api
  module V1
    class ConceptsController < BaseController
      def index
        if params[:domain_slug].present?
          domain = Domain.friendly.find(params[:domain_slug])
          render json: ConceptSummarySerializer.new(domain.concepts).serializable_hash
        else
          # Flat search index: small enough to ship in one request, lets the
          # client do real-time substring matching without extra round trips.
          concepts = Concept.includes(:domain).order(:position, :id)
          render json: ConceptSearchSerializer.new(concepts).serializable_hash
        end
      end

      def show
        concept = Concept.friendly.find(params[:slug])
        render json: ConceptSerializer.new(concept).serializable_hash
      end

      def view
        # increment_counter is a single atomic UPDATE — safe under concurrent
        # opens and skips validations/callbacks that would slow the hot path.
        concept = Concept.friendly.find(params[:slug])
        Concept.increment_counter(:views_count, concept.id)
        concept.reload
        render json: ConceptSerializer.new(concept).serializable_hash
      end
    end
  end
end
