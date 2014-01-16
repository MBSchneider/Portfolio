class Contact < ActiveRecord::Base
  attr_accessible :name, :email, :content
  validates :name, :email, :content, :presence => true

  # def initialize(attributes = {})
  #   attributes.each do |name, value|
  #     send("#{name}=", value)
  #   end
  # end

  def persisted?
    false
  end

end
