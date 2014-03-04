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

      def create
        article = Article.create(article_params)

        respond_with :api, :v2, article
      end

      private

      def article_params
        params.require(:article).permit(:name)
      end
    end
  end
end
