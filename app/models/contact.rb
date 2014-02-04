# Contact model is used for ContactMailer
class Contact < ActiveRecord::Base
  attr_accessible :name, :email, :content
  validates :name, :content, presence: true

  def persisted?
    false
  end
end
