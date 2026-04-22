module Api
  module V1
    class ConceptsController < BaseController
      def index
        domain = Domain.friendly.find(params[:domain_slug])
        concepts = domain.concepts
        render json: ConceptSummarySerializer.new(concepts).serializable_hash
      end

      def show
        concept = Concept.friendly.find(params[:slug])
        render json: ConceptSerializer.new(concept).serializable_hash
      end
    end
  end
end
