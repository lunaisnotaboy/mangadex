# frozen_string_literal: true

class Manga < ApplicationRecord
  include ImageUploader::Attachment(:image)

  has_many :chapters, dependent: :destroy
end
