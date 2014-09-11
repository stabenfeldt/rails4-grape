class Department < ActiveRecord::Base
  has_many :users
  has_many :projects
  has_many :customers, :through => :projects

  validates :title, :uniqueness => true
end
