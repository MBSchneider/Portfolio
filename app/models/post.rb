class Post < ActiveRecord::Base
  has_many :comments, as: :commentable
  attr_accessible :content, :title, :published
  validates_presence_of :title, :content

  belongs_to :author, class_name: "User"

  def publish!
    published = true
    save!
  end

  def published?
    published == true
  end

end
