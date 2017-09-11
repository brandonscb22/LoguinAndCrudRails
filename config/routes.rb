Rails.application.routes.draw do

  # Pagina Principal
  get 'home', to: 'welcome#index'
  # Cerrar session
  get 'logout', to: 'sessions#destroy'

  get 'register', to: 'users#new'

  resources :meters

  resources :users

  resources :sessions

  root 'sessions#new'

end
