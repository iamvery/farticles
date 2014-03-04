module Api
  module V2
    class ArticlesController < ApiController
      respond_to :json

      def index
        articles = Article.all

        respond_with articles, meta: { total: articles.count }
      end

      def show
        article = Article.find(params[:id])

        respond_with article
      end
    end
  end
end
