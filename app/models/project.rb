class Project < ActiveRecord::Base
  has_many :comments, as: :commentable
  attr_accessible :title, :technologies_used, :image
  validates_presence_of :title, :technologies_used
  validates_length_of :title, :minimum => 4
  mount_uploader :image, ImageUploader
end
