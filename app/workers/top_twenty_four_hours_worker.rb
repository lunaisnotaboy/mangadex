# frozen_string_literal: true

require 'sidekiq-scheduler'

class TopTwentyFourHoursWorker
  include Sidekiq::Worker

  def perform(*_args)
    puts 'We are the sultans of swing!'
  end
end
