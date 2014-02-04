# Projects contain descriptions, pics, and web urls of projects
class Project < ActiveRecord::Base
  has_many :comments, as: :commentable
  validates_presence_of :title

  attr_accessible :title, :technologies_used, :image, :remote_image_url,
                  :short_description, :web_page, :priority

  mount_uploader :image, ImageUploader
end
