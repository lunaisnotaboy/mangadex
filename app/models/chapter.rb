# frozen_string_literal: true

class Chapter < ApplicationRecord
  belongs_to :mangas
  belongs_to :users
  has_many :views
end
