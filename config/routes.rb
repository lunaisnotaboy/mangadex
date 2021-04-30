Rails.application.routes.draw do
  devise_scope :user do
    get '/password_reset', to: 'devise/passwords#new'
    get "/login", to: 'devise/sessions#new'
    get '/signup', to:'devise/registrations#new'
  end

  devise_for :users

  get '/login', to: 'login#new'

  get '/about', to: 'about#index'

  root to: 'home#index'
end
