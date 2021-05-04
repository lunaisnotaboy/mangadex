# frozen_string_literal: true

require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  devise_scope :user do
    get '/password_reset', to: 'devise/passwords#new'
    get '/login', to: 'devise/sessions#new'
    get '/signup', to: 'devise/registrations#new'
  end

  devise_for :users

  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  get '/rules', to: 'rules#index'

  get '/stats', to: 'stats#show'

  get '/about', to: 'about#index'

  # Redirects

  get '/stats/top', to: 'stats#top'

  root to: 'home#index'

  mount MangaDex::API => '/'
end
