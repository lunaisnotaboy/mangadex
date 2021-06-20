# frozen_string_literal: true

# Require Sidekiq dashboard

require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  # Draw Devise scopes

  devise_scope :user do
    get '/password_reset', to: 'devise/passwords#new'
    get '/login', to: 'devise/sessions#new'
    get '/signup', to: 'devise/registrations#new'
  end

  # Default Devise URLs (TODO: use custom URLs above, then get rid of this)

  devise_for :users

  # Authenticate user, verify admin status, then grant access to admin-only URLs

  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'

    get '/admin', to: 'admin#index'

    get '/admin/database', to: 'admin#db'

    get '/admin/sidekiq', to: 'admin#sidekiq'
  end

  # Users

  get '/user/:id/:username', to: 'user#show'

  get '/user/:id', to: 'user#show'

  get '/settings', to: 'settings#edit'

  patch '/settings', to: 'settings#update'

  put '/settings', to: 'settings#update'

  # Manga

  get '/title/:id/:title', to: 'manga#show'

  get '/title/:id', to: 'manga#show'

  # Route various pages (about, rules, stats, etc.)

  get '/developers', to: 'docs#index'

  get '/rules', to: 'rules#index'

  get '/stats', to: 'stats#show'

  get '/about', to: 'about#index'

  # Route redirects

  get '/stats/top', to: 'stats#top'

  get '/admin/stats', to: 'admin#stats'

  # Root page

  root to: 'home#index'

  # Mount API

  mount MangaDex::API => '/'

  # Mount endpoints

  mount ImageUploader.derivation_endpoint => '/uploads/size'
end
