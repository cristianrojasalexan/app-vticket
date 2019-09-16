class HomeController < ApplicationController
  before_action :require_login
  include HomeHelper
  
  def index
    @user = get_username(current_user.id)
  end

  private
  def require_login
    unless current_user
      redirect_to new_user_session_path
    end
  end
end