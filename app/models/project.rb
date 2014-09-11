class Project < ActiveRecord::Base
  has_many :tasks
  has_many :attachments
  has_many :hours_spents, :through => :tasks
  has_many :users,        :through => :tasks

  belongs_to :customer
  belongs_to :user
  belongs_to :department

  validates :customer_id,    :presence => true
  validates :start_date,     :presence => true
  validates :due_date,       :presence => true
  validates :department_id,  :presence => true
  validates :project_number, :presence => true


  def professions
    professions = []
    users.each { |u| professions << u.profession }
    professions.uniq
  end

  def users_with_profession(profession:)
    users.where(profession_id: profession.id)
  end

  def hours_spent_for_profession(profession, overtime:)
    users = users_with_profession(profession: profession)
    all_kinds_of_hours = users.collect { |u| hours_spents.where(user: u ).to_a }.flatten
    all = all_kinds_of_hours.select {|h| h.send(overtime)}
    all.select { |h| h.send(overtime).present? }
  end

  def hours_spent_total(profession: nil, changed: false, overtime: )
    users = profession ? users_with_profession(profession: profession) : users
    users.inject { |u| hours_total_for(u, changed: changed, overtime: overtime) }
  end

  def hours_total_for(user, changed: false, overtime:)
    sum = 0
    hours_spents.where(user: user).each do |h|
      if changed
        if overtime
          sum += h.changed_value(overtime)        || 0
        else
          sum += h.changed_value_hour             || 0
          sum += h.changed_value_piecework_hours  || 0
          sum += h.changed_value_overtime_50      || 0
          sum += h.changed_value_overtime_100     || 0
        end
      else
        if overtime
          sum += h.send(overtime)    || 0
        else
          sum += h.hour             || 0
          sum += h.piecework_hours  || 0
          sum += h.overtime_50      || 0
          sum += h.overtime_100     || 0
        end
      end
    end
    sum
  end

  def name_of_users(profession: nil)
    if profession
      u = users_with_profession(profession: profession)
      u.pluck(:first_name).join(', ')
    else
      users.pluck(:first_name).join(', ')
    end
  end

  def address
    execution_address || customer.address
  end

  #def name_of_users(profession: nil)
  #  if profession
  #    #raise "users_with_profession: #{users_with_profession(profession: profession)}"
  #    users = users_with_profession(profession: profession)
  #    users.pluck(:first_name).join(', ').split(',').collect { |n| n.strip }
  #    #u.pluck(:first_name).join(', ').collect { |n| n.strip }
  #  else
  #    users.pluck(:first_name).join(', ').collect { |n| n.strip }
  #  end
  #end

  def week_numbers
    w = hours_spents.collect { |h| h.created_at.to_datetime.cweek }
    w.uniq.sort!.join(', ')
  end

end
