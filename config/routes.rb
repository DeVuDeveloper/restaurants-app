Rails.application.routes.draw do
  devise_for :users

  root "restaurants#index"

  resources :managers

  resources :guests, :except => [:destroy, :new] do
    resources :invitations, :except => [:edit, :new, :create]
  end

  resources :restaurants do
    resources :configurations, :only => [:create] do
      post :setup_seats
      resources :seats, :only => [:show]
    end

    resources :reservations, :except => [:destroy]

    resources :menus, :except => [:index] do
      resources :meals, :except => [:index]
    end
  end


  resource :users do
    resources :friendships

    resources :reviews, :only => [:index, :show, :update]
  end
end
