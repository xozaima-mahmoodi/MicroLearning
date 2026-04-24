module Api
  module V1
    class CategoriesController < BaseController
      def index
        # Preload concepts under each domain so per-domain and aggregate
        # `concepts_count` in the serializer stay N+1-free.
        categories = Category.ordered.includes(domains: :concepts)
        render json: CategorySerializer.new(categories).serializable_hash
      end
    end
  end
end
