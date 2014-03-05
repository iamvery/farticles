module Api
  module V2
    class ArticlesController < ApiController
      respond_to :json

      def index
        articles = Article.all

        respond_with articles, meta: { total: articles.count }
      end

      def show
        article = Article.find(article_id)

        respond_with article
      end

      def create
        article = Article.create(article_params)

        respond_with :api, :v2, article
      end

      def update
        article = Article.find(article_id)

        article.update_attributes(article_params)

        respond_with :api, :v2, article
      end

      def destroy
        article = Article.find(article_id)

        article.destroy

        respond_with :api, :v2, article
      end

      private

      def article_id
        params.fetch(:id)
      end

      def article_params
        params.require(:article).permit(:name)
      end
    end
  end
end
