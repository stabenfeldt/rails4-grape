class ExcelProjectTools

  #def self.hours_for_users(project:, profession:, changed: false)
  #  hours = []
  #  project.users.where(profession: profession).each do |user|
  #      hours << project.hours_total_for(user, changed: changed)
  #  end
  #  hours.map {|x| "#{x}" }
  #end
  
  # Returns an array with nr of hours 
  def self.hours_for_users(project:, profession:, changed: false, overtime:)
    hours = []
    project.users.where(profession: profession).each do |user|
      hours_spent = []
      hours_spent << project.hours_spents.where(user: user).all
      hours_spent.flatten!
      hours << hours_spent.map { |hs| hs.changed_value(overtime) }
    end
    hours.flatten!
    hours.map {|x| "#{x}" }
  end

  def self.user_names(project:, profession_title:)
    profession = Profession.where(title: profession_title).first
    project.name_of_users(profession: profession).split(',').flatten
  end

  def self.sum_piecework_hours(project: project, user: user)
    HoursSpent.where(user: user, project: project).sum(:piecework_hours)
  end

  def self.sum_workhours(project: project, user: user)
    HoursSpent.where(user: user, project: project).sum(:hour)
  end

  def self.sum_overtime_50(project: project, user: user)
    HoursSpent.where(user: user, project: project).sum(:overtime_50)
  end

  def self.sum_overtime_100(project: project, user: user)
    HoursSpent.where(user: user, project: project).sum(:overtime_100)
  end


end
