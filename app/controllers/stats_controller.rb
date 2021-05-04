# frozen_string_literal: true

class StatsController < ApplicationController
  def show
    @page = 'stats-top'
  end

  # `def top` is kept for backwards compatibility

  def top
    redirect_to stats_url
  end
end
