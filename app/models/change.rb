class Change < ActiveRecord::Base
  belongs_to :hours_spent
  validates :hours_spent,  presence: true


  def self.create_from_hours_spent(hours_spent: hours_spent, reason: reason)
    c = Change.new(hours_spent.attributes.except(
      'customer_id',
      'id',
      'task_id',
      'date',
      'user_id',
      'project_id'
    )) 
    c.hours_spent_id = hours_spent.id
    c.reason = reason
    c
  end

end

