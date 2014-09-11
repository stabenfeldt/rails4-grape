class Profession < ActiveRecord::Base
  validates :title, :uniqueness => true
end
