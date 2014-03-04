module Api
  module V1
    class ArticlesController < ApiController
      respond_to :json

      def index
        articles = Article.all

        respond_with articles, root: false, each_serializer: V1::ArticleSerializer
      end

      def show
        article = Article.find(params[:id])

        respond_with article, root: false, serializer: V1::ArticleSerializer
      end
    end
  end
end
