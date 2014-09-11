require 'spec_helper'

describe "Registered hours on a Task" do
  before :each do
    @user = Fabricate(:user, first_name: 'Josh')
    Fabricate(:paint, title: 'Acryl')
    Fabricate(:paint, title: 'Beis')
    @sporveiene = Fabricate(:customer, name: 'Oslo Sporveier AS')
    @project = Fabricate(:project, customer: @sporveiene)
    @task = Fabricate(:task)
    @user.tasks << @task
  end

  pending "An user can register hours on the tasks he is delegated" do
    visit user_path(@user)
    HoursSpent.all.size.should eq 0
    click_link "Aktive oppdrag"
    click_link "Registrer timer"
    fill_in 'Akkord', with: 20
    fill_in '50%', with: 50
    fill_in 'Beskrivelse', with: 'Malt begge sider av veggen.'
    click_button 'Lagre'
    HoursSpent.all.size.should eq 1
    h = HoursSpent.last
    h.piecework_hours.should eq 20
    h.overtime_50.should eq 50
    h.description.should eq 'Malt begge sider av veggen.'
  end

  
end
