# frozen_string_literal: true

namespace    = ENV.fetch('REDIS_NAMESPACE', nil)
redis_params = { url: ENV['REDIS_URL'] }
