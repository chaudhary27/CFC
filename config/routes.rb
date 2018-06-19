Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resource :profile
  end
  # path to homepage
  root to: 'pages#home'
  # path to about page
  get 'about', to: 'pages#about' 
  # path to ir dashboard
  get 'ir_dashboard', to: 'pages#ir_dashboard'
  # path to virustotal page
  get 'virustotal', to: 'pages#virustotal'
  # path to cyberchef page
  get 'cyberchef', to: 'pages#cyberchef'
  # CRUD operations path for contacts model
  resources :contacts, only: :create
  get 'contact-us', to: 'contacts#new', as: 'new_contact'
end
