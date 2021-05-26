Rails.application.routes.draw do
  # namespace :admin do
  #   resources :reviews
  # end

  resources :restaurants do
    collection do
      # GET /restaurants/top
      # get '/restaurants/top', to: 'restaurants#top'
      get :top
    end

    member do
      # GET /restaurants/42/chef
      get :chef
    end

    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:destroy]
  # SAME AS: resources :reviews, except: [:index, :show, :edit, :update]
end
