class Notify < Thor

  desc "missing_hours", "Notify users that has forgot to register hours"
  def missing_hours
    puts "Loading Rails environment..."
    require File.expand_path('config/environment.rb')

    # Find active projects
    @project = Project.all



  end
end
