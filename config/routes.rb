Farticles::Application.routes.draw do
  namespace :api do
    scope module: :v1 do
      resources :articles
    end
  end
end
