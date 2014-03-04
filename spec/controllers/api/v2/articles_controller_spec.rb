require 'spec_helper'

describe Api::V2::ArticlesController do
  describe 'GET #index' do
    let(:articles_json){ json.fetch('articles') }
    let(:meta_json)    { json.fetch('meta') }

    it 'responds with array of articles' do
      article = Article.create!(name: 'So Good')

      get_json :index

      expect(articles_json.first.fetch('name')).to eq(article.name)
    end

    it 'includes article total meta data with response' do
      Article.create!(name: 'A Thing')

      get_json :index

      expect(meta_json.fetch('total')).to eq(1)
    end
  end

  describe 'GET #show' do
    let(:article_json){ json.fetch('article') }

    it 'responds with the article' do
      article = Article.create!(name: 'Very Nice')

      get_json :show, id: article.id

      expect(article_json.fetch('name')).to eq(article.name)
    end
  end

  describe 'POST #create' do
    it 'responds with article when successful' do
      article_name = 'Awesome'

      post_json :create, article: { name: article_name }

      article_json = json.fetch('article')

      expect(response).to be_success
      expect(article_json.fetch('name')).to eq(article_name)
    end

    it 'responds with errors when record cannot be created' do
      post_json :create, article: { name: '' }

      error_json = json.fetch('errors')

      expect(response).to be_unprocessable
      expect(error_json).to be_present
    end
  end
end
