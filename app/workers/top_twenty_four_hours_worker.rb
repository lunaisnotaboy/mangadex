# frozen_string_literal: true

class TopTwentyFourHoursWorker
  include Sidekiq::Worker

  def perform(*args)
    # Do something
  end
end
