module Api
  module V1
    class BaseController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

      private

      def render_not_found(error)
        render json: { errors: [ { status: "404", title: "Not Found", detail: error.message } ] }, status: :not_found
      end
    end
  end
end
