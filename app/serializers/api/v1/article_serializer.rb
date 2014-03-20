module Api
  module V1
    class ArticleSerializer < ActiveModel::Serializer
      self.root = false

      attributes :id, :title, :category

      def title
        object.name
      end

      def category
        object.categories.first.try(:name)
      end
    end
  end
end
