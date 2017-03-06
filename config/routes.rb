Rails.application.routes.draw do
  get 'questions/create'

  get 'tickets/create'

  mount ActionCable.server => '/cable'
  mount Attachinary::Engine => "/attachinary"
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :livestreams do
    resources :tickets, only: [:create]
    resources :questions, only: [:create]
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
  post '/become_a_livestreamer', to: 'pages#profile_create'

################################
#This is for buying tickets

#################################
# This line should be at the end

  get '/:category' => 'livestreams#category_show'
  # resources :chat_rooms, only: [:new, :create, :show, :index]
end
