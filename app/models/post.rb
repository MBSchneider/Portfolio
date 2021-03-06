# Blog post class
class Post < ActiveRecord::Base
  has_many :comments, as: :commentable
  attr_accessible :content, :title, :published, :short_description, :image
  validates_presence_of :title, :content

  mount_uploader :image, ImageUploader

  belongs_to :author, class_name: 'User'

  def publish!
    self.published = true
    save!
  end

  def published?
    published == true
  end
end
