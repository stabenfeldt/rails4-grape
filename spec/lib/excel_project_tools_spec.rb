require 'spec_helper'

describe ExcelProjectTools do

  before do
    @project = Fabricate(:project)
    @user1 = Fabricate(:user, first_name: 'John')
    @snekker_profession = Fabricate(:profession, title: 'Snekker')
    @snekker_jens = Fabricate(:user, first_name: 'Snekker Jens',
      profession: @snekker_profession)
    @snekker2 = Fabricate(:user, first_name: 'Snekker 2',
      profession: @snekker_profession)
    @task = Fabricate(:task, project: @project)
    @user1.tasks << @task
    @snekker_jens.tasks << @task
    @snekker2.tasks << Fabricate(:task, project: @project)

    Fabricate(:hours_spent, hour: 10, task: @task, user: @user1 )
    Fabricate(:hours_spent, hour: 10, task: @task, user: @user1 )
    @hours_for_jens = Fabricate(:hours_spent, hour: 19, 
                                        task: @task, user: @snekker_jens )
  end

  #it %q{returns a comma separated 
  #      string with the sum of the hours each user has worked} do
  #  snekker = Profession.where(title: 'Snekker')
  #  ExcelProjectTools.hours_for_users(project: @project, 
  #    profession: snekker, overtime: :hour).should eq ['19', '0']
  #end

  it 'comma separated string with changed values for overtime' do
    @change = Change.create_from_hours_spent(hours_spent: @hours_for_jens, 
       reason: 'adjusted' )
    @change.update_attribute(:hour, 1)
    snekker = Profession.where(title: 'Snekker')
    ExcelProjectTools.hours_for_users(project: @project, overtime: :hour,
      profession: snekker, changed: true).should eq ['1']
  end


  it %q{returns a comma separated string of names for profession} do
    ExcelProjectTools.user_names(project: @project, 
      profession_title: 'Snekker').should eq ['Snekker Jens', " Snekker 2"]
  end

  it 'sum_piecework_hours' do
    Fabricate(:hours_spent, piecework_hours: 10, 
              task: @task, user: @user1, project: @project )
    ExcelProjectTools.sum_piecework_hours(project: @project, 
                                          user: @user1 ).should eq 10
  end

  it 'sum_workhours' do
    Fabricate(:hours_spent, piecework_hours: 16, 
              task: @task, user: @user1, project: @project )
    ExcelProjectTools.sum_piecework_hours(project: @project, 
                                          user: @user1 ).should eq 16
  end

  it 'sum_overtime_50' do
    Fabricate(:hours_spent, piecework_hours: 50, 
              task: @task, user: @user1, project: @project )
    ExcelProjectTools.sum_piecework_hours(project: @project, 
                                          user: @user1 ).should eq 50
  end

  it 'sum_overtime_100' do
    Fabricate(:hours_spent, piecework_hours: 100, 
              task: @task, user: @user1, project: @project )
    ExcelProjectTools.sum_piecework_hours(project: @project, 
                                          user: @user1 ).should eq 100
  end

end
