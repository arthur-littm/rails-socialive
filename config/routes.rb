Rails.application.routes.draw do
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  resources :livestreams
  get '/dashboard' => 'pages#dashboard'






# This line should be at the end
  get '/:category' => 'livestreams#category_show'
  # --

end
