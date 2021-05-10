# frozen_string_literal: true

class Manga < ApplicationRecord
  include ImageUploader::Attachment(:cover)

  has_many :chapters, dependent: :destroy
  has_many :views
end
