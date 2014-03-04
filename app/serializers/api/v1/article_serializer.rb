module Api
  module V1
    class ArticleSerializer < ActiveModel::Serializer
      self.root = false

      attributes :id, :title

      def title
        object.name
      end
    end
  end
end
