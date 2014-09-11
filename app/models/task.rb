class Task < ActiveRecord::Base

  belongs_to :project
  belongs_to :paint
  has_and_belongs_to_many :users

  has_many :hours_spents

  validates :project_id, :presence => true
  validates :start_date, :presence => true
  validates :due_date,   :presence => true

  attr_accessor :department_id

  after_create :notify_workers, if: :sms_employee_when_new_task_created

  def sms_employee_when_new_task_created
    project.sms_employee_when_new_task_created
  end

  def hours_total
    self.hours_spents.sum(:hour) +
    self.hours_spents.sum(:piecework_hours) +
    self.hours_spents.sum(:overtime_50) +
    self.hours_spents.sum(:overtime_100)
  end

  def name_of_users
    users.pluck(:first_name).join(', ' )
  end

  private

  def notify_workers
    domain = "#{ ENV['DOMAIN'] || 'allieroforms.dev' }"
    msg = "Du har fått tildelt en ny oppgave. Les mer: "+ "http://#{domain}/tasks/#{id}"
    users.each do |u|
      Sms.send_msg("47#{u.mobile}", msg)
    end
  end
  
end
