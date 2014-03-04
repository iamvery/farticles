Farticles::Application.routes.draw do
  namespace :api do
    scope module: :v1, as: :v1, constraints: ApiVersionConstraint.new(version: 1) do
      resources :articles
    end

    scope module: :v2, as: :v2 do
      resources :articles
    end
  end
end
