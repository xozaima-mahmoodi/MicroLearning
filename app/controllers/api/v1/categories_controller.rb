module Api
  module V1
    class CategoriesController < BaseController
      def index
        categories = Category.ordered.includes(:domains)
        render json: CategorySerializer.new(categories).serializable_hash
      end
    end
  end
end
