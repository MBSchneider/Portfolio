class Project < ActiveRecord::Base
  has_many :comments, as: :commentable

  attr_accessible :title, :technologies_used, :image, :remote_image_url

  # validates_presence_of :title, :technologies_used
  # validates_length_of :title, :minimum => 4

  mount_uploader :image, ImageUploader

  def image_name
    File.basename(image.path || image.filename) if image
  end

end
