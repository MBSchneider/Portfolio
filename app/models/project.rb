class Project < ActiveRecord::Base
  attr_accessible :title, :technologies_used
  validates_presence_of :title, :technologies_used
end
