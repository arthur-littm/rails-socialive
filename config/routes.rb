Rails.application.routes.draw do
  get 'livestreams/index'

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  resources :livestreams

  get '/:category' => 'livestreams#category_show'
end
