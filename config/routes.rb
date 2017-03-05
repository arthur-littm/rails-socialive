Rails.application.routes.draw do
  get 'tickets/create'

  mount ActionCable.server => '/cable'
  mount Attachinary::Engine => "/attachinary"
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :livestreams do
    resources :tickets, only: [:create]
  end
  get '/dashboard' => 'pages#dashboard'

# Following/Follower routing essential
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships,       only: [:create, :destroy]


  patch '/dashboard', to: 'pages#profile_update'

################################
#This is for buying tickets

#################################
# This line should be at the end

  get '/:category' => 'livestreams#category_show'
  # resources :chat_rooms, only: [:new, :create, :show, :index]
end
