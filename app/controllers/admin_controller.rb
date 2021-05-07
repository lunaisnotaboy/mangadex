# frozen_string_literal: true

class AdminController < ApplicationController
  def index
    @page = 'admin-stats'
  end

  def db
    @page = 'admin-database'
  end

  def sidekiq
    @page = 'admin-sidekiq'
  end

  # `def stats` is kept for backwards compatibility

  def stats
    redirect_to admin_url
  end
end
