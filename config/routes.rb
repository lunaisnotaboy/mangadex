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

  # Authenticate user, verify admin status, then grant access to Sidekiq dashboard

  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  # Route various pages (about, rules, stats, etc.)

  get '/developers', to: 'docs#index'

  get '/rules', to: 'rules#index'

  get '/stats', to: 'stats#show'

  get '/about', to: 'about#index'

  # Route redirects

  get '/stats/top', to: 'stats#top'

  # Root page

  root to: 'home#index'

  # Mount API

  mount MangaDex::API => '/'
end
