class Post < ActiveRecord::Base
  attr_accessible :content, :title
  validates_presence_of :title, :content

  belongs_to :author, class_name: "User"
end
