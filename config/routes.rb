# frozen_string_literal: true

Rails.application.routes.draw do
  devise_scope :user do
    get '/password_reset', to: 'devise/passwords#new'
    get '/login', to: 'devise/sessions#new'
    get '/signup', to: 'devise/registrations#new'
  end

  devise_for :users

  get '/rules', to: 'rules#index'

  get '/stats', to: 'stats#show'

  get '/about', to: 'about#index'

  # Redirects

  get '/stats/top', to: 'stats#top'

  root to: 'home#index'

  mount MangaDex::API => '/'
end
