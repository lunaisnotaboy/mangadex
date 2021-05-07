# frozen_string_literal: true

require 'sidekiq-scheduler'

class TopSevenDaysWorker
  include Sidekiq::Worker

  def perform(*_args)
    puts 'It\'s scary how fast Elon Musk went from Tony Stark to Lex Luthor (Calculating the last seven days)'
  end
end
