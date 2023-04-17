class Admin::ApplicationController < ActionController::Base
    before_action :authenticate_user! , :admin_user

  private

  def admin_user
    unless current_user && current_user.isAdmin
      flash[:error] = "You are not authorized to perform this action."
      redirect_to root_path
    end 
  end

end