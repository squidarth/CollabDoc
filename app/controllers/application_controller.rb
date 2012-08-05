class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected

  def e404
    render "layouts/404"
  end
end
