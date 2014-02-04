# encoding: utf-8

# For blog and project picture uploads
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :fog

  version :proj do
    process resize_to_fill:  [370, 233]
  end

  version :blog do
    process resize_to_fill: [270, 170]
  end
end
