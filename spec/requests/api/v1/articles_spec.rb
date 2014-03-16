require 'spec_helper'

describe 'articles v1 endpoint' do
  describe 'index' do
    it 'responds with a list of articles' do
      article = Article.create!(name: 'So Good')

      get_v1 '/api/articles.json'

      expect(json.first.fetch('title')).to eq(article.name)
    end
  end

  describe 'show' do
    it 'responds with the article' do
      article = Article.create!(name: 'Very Nice')

      get_v1 "/api/articles/#{article.id}.json"

      expect(json.fetch('title')).to eq(article.name)
    end
  end
end
