Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  get 'about', to: 'pages#about' 
  
  get 'ir_dashboard', to: 'pages#ir_dashboard'
  
  resources :contacts, only: :create
  get 'contact-us', to: 'contacts#new', as: 'new_contact'
end
