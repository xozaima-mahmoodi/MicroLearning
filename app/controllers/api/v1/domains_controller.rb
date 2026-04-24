module Api
  module V1
    class DomainsController < BaseController
      def index
        # Preload concepts so the serializer's `concepts_count` doesn't N+1.
        domains = Domain.ordered.includes(:concepts)
        render json: DomainSerializer.new(domains).serializable_hash
      end

      def show
        domain = Domain.includes(:concepts).friendly.find(params[:slug])
        render json: DomainSerializer.new(domain).serializable_hash
      end
    end
  end
end
