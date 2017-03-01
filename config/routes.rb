Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  get 'livestreams/index'

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  resources :livestreams

  resources :chat_rooms, only: [:new, :create, :show, :index]

  get '/:category' => 'livestreams#category_show'
end
