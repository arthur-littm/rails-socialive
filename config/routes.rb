Rails.application.routes.draw do
  get 'livestreams/index'

  devise_for :users
  root to: 'pages#home'

  resources :livestreams
end
