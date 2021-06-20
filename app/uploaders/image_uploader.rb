# frozen_string_literal: true

require 'image_processing/mini_magick'

class ImageUploader < Shrine
  plugin :derivation_endpoint, prefix: 'uploads/size' # matches mount point
  plugin :default_url

  derivation :thumbnail do |file, width, height|
    ImageProcessing::MiniMagick
      .source(file)
      .resize_to_limit!(width.to_i, height.to_i)
  end

  Attacher.default_url do |**_options|
    '/mangadex-512.png'
  end
end
