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
      category1 = Category.create!(name: 'News')
      category2 = Category.create!(name: 'Gossip')
      article   = Article.create!(name: 'Very Nice', categories: [category1, category2])

      get_v1 "/api/articles/#{article.id}.json"

      expect(json.fetch('title')).to eq(article.name)
      # v1 api only supports 1 category
      expect(json.fetch('category')).to eq(category1.name)
    end
  end
end
