Farticles::Application.routes.draw do
  namespace :api do
    scope module: :v1, constraints: ApiVersionConstraint.new(version: 1) do
      resources :articles
    end

    scope module: :v2 do
      resources :articles
    end
  end

  def doc(resource=nil, options={})
    path = ['doc', options[:prefix], resource].flatten.compact.join('/')
    get path => 'docs#show', id: path
  end

  doc #index

  doc :v1
  doc :articles, prefix: :v1

  doc :v2
  doc :articles, prefix: :v2
end
