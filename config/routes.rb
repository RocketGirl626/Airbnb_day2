Rails.application.routes.draw do
  devise_for :users
  get '/' => 'properties#index'

  # resources :users do
  #   resources :properties
  # end

  resources :properties do
    resources :reviews
  end


end
