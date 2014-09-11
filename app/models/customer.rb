class Customer < ActiveRecord::Base
  #validates :name,           :presence => true          
  validates :customer_nr, :uniqueness => true

  has_many :tasks, dependent: :destroy
  has_many :projects, dependent: :destroy

end
