class PutAllUsersInTheBratfosDepartment < ActiveRecord::Migration
  def change
    dep = Department.where(title: 'Avd. 545 Bratfoss').first_or_create
    User.all.each do |u|
      p "Updating #{u.name}"
      u.update_attribute(:department, dep)
    end
  end
end
