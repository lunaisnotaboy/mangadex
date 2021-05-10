# frozen_string_literal: true

class Chapter < ApplicationRecord
  belongs_to :manga
  belongs_to :users
  has_many :views
end
