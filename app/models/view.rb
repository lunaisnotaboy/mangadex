# frozen_string_literal: true

class View < ApplicationRecord
  belongs_to :manga
  belongs_to :chapters
  belongs_to :users
end
