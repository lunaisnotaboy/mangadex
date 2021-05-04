# frozen_string_literal: true

class View < ApplicationRecord
  belongs_to :mangas
  belongs_to :chapters
  belongs_to :users
end
