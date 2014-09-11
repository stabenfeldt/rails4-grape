class StaticPagesController < ApplicationController

  def blog
  end

  def video
  end

  def hms
  end

  def frontpage_manager
  end

  def new_assignment
    @customers = Customer.all
  end



end
