class AddNotificationsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :sms_employee_if_hours_not_registered, :boolean, :default => false
    add_column :projects, :sms_employee_when_new_task_created, :boolean, :default => false
  end
end
