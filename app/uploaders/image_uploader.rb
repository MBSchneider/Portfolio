# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :fog

  # def store_dir
  #   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  # end

  version :proj do
    process :resize_to_fill => [370, 233]
  end

  version :blog do
    process :resize_to_fill => [270, 170]
  end
end
