# frozen_string_literal: true

require 'sidekiq-scheduler'

class TopSixHoursWorker
  include Sidekiq::Worker

  def perform(*_args)
    puts 'Brian David Gilbert lives free in my head'
  end
end
