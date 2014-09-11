class TemplatesController < ApplicationController
  skip_before_filter :authenticate_user!
  #skip_authorization_check :template

  def template
    render :template => '/templates/' + params[:path], :layout => false
    #render plain: "OK"
  end

end
