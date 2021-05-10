# frozen_string_literal: true

class SettingsController < ApplicationController
  def index
    @page = 'settings'
  end

  def profile
    @page = 'settings-profile'
  end

  def site
    redirect_to settings_path
  end
end
