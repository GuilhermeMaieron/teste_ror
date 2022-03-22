Rails.application.routes.draw do

  devise_for :users

  resources :posts do
    resources :likes, controller: "posts", action: :likes, only: :index
    collection do
      get "pages/:page", action: :index, controller: "posts", as: "page"
      get "pages", action: :index, controller: "posts"
    end
  end

  namespace :api, defaults: { format: :json} do
    resources :posts do
      resources :likes, controller: "posts", action: :likes, only: :index
      collection do
        get "pages/:page", action: :index, controller: "posts", as: "page"
        get "pages", action: :index, controller: "posts"
      end
    end
  end

  root to: "posts#index"
end
