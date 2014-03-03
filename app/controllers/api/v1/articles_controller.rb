module Api
  module V1
    class ArticlesController < ApplicationController
      respond_to :json

      def index
        articles = Article.all

        respond_with articles, root: false
      end

      def show
        article = Article.find(params[:id])

        respond_with article, root: false
      end
    end
  end
end
