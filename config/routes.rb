Rails.application.routes.draw do

  ActiveAdmin.routes(self)


  mount ActionCable.server => '/cable'
  mount Attachinary::Engine => "/attachinary"
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  resources :livestreams do
    resources :products, only: [:create, :new]
    resources :tickets, only: [:create]
    resources :questions, only: [:create]
    resources :donations, only: [:create]
    member do
        get :flop
        get :flop_start
    end
  end

  get '/dashboard' => 'pages#dashboard'
  get '/become-a-livestreamer' => 'pages#become_a_livestreamer'

# Following/Follower routing essential
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships,       only: [:create, :destroy]


  patch '/dashboard', to: 'pages#profile_update'


  ################################
  #This is for buying rubies
  get '/buy_rubies' => 'pages#buy_rubies'

  #########################################
  #This is for stripe

  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end
  #################################

  resources :profiles, only: [:show, :index]

# This line should be at the end
  get '/:category' => 'livestreams#category_show'
  # resources :chat_rooms, only: [:new, :create, :show, :index]
end
