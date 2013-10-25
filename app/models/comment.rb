class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :author, class_name: "User"


  attr_accessible :approved, :author, :author_email, :author_url, :body, :referrer, :user_agent, :user_ip
  validates_presence_of :body

end
