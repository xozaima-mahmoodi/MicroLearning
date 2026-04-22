module Api
  module V1
    class DomainsController < BaseController
      def index
        domains = Domain.ordered
        render json: DomainSerializer.new(domains).serializable_hash
      end

      def show
        domain = Domain.friendly.find(params[:slug])
        render json: DomainSerializer.new(domain).serializable_hash
      end
    end
  end
end
