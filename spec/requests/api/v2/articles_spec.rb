require 'spec_helper'

describe 'articles v2 endpoint' do
  describe 'index' do
    let(:articles_json){ json.fetch('articles') }
    let(:meta_json)    { json.fetch('meta') }

    it 'responds with list of articles' do
      article = Article.create!(name: 'So Good')

      get_v2 '/api/articles.json'

      expect(articles_json.first.fetch('name')).to eq(article.name)
    end

    it 'includes article total meta data with response' do
      Article.create!(name: 'A Thing')

      get_v2 '/api/articles.json'

      expect(meta_json.fetch('total')).to eq(1)
    end
  end

  describe 'show' do
    let(:article_json){ json.fetch('article') }

    it 'responds with the article' do
      news    = Category.create!(name: 'News')
      gossip  = Category.create!(name: 'Gossip')
      article = Article.create!(name: 'Very Nice', categories: [news, gossip])

      get_v2 "/api/articles/#{article.id}.json"

      category_json = article_json.fetch('categories')

      expect(article_json.fetch('name')).to eq(article.name)
      expect(category_json.length).to eq(2)
      expect(category_json.first.fetch('name')).to eq(news.name)
      expect(category_json.last.fetch('name')).to eq(gossip.name)
    end
  end

  describe 'POST #create' do
    it 'responds with article when successful' do
      article_name = 'Awesome'

      post_v2 "/api/articles.json", article: { name: article_name }

      article_json = json.fetch('article')

      expect(response).to be_success
      expect(article_json.fetch('name')).to eq(article_name)
    end

    it 'responds with errors when record cannot be created' do
      post_v2 "/api/articles.json", article: { name: '' }

      error_json = json.fetch('errors')

      expect(response).to be_unprocessable
      expect(error_json).to be_present
    end
  end

  describe 'PATCH #update' do
    let!(:article){ Article.create!(name: 'Original') }

    it 'responds with success' do
      patch_v2 "/api/articles/#{article.id}.json", article: { name: 'Updated' }

      expect(response).to be_success
    end

    it 'responds with errors when record cannot be updated' do
      patch_v2 "/api/articles/#{article.id}.json", article: { name: '' }

      error_json = json.fetch('errors')

      expect(response).to be_unprocessable
      expect(error_json).to be_present
    end
  end

  describe 'DELETE #destroy' do
    it 'responds with success' do
      article = Article.create!(name: 'An Article')

      delete_v2 "/api/articles/#{article.id}.json"

      expect(response).to be_success
    end
  end
end
