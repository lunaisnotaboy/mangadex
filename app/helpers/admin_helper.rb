# frozen_string_literal: true

require 'json'

module AdminHelper
  def total_hits
    View.all.count
  end

  def tachi_hits
    View.where(type: ['tachiyomi']).count
  end

  def mean_hits
    (tachi_hits / total_hits * 100).round.to_s
  end

  def users_x
    User.pluck(:created_at).to_json
  end

  def users_y
    User.count.to_json
  end
end
