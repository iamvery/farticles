require 'spec_helper'

describe Api::V1::ArticlesController do
  describe 'GET #index' do
    it 'responds with array of articles' do
      article = Article.create!(name: 'So Good')

      get_json :index

      expect(json.first.fetch('title')).to eq(article.name)
    end
  end

  describe 'GET #show' do
    it 'responds with the article' do
      article = Article.create!(name: 'Very Nice')

      get_json :show, id: article.id

      expect(json.fetch('title')).to eq(article.name)
    end
  end
end
