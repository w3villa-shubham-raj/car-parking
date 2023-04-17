class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    extend ApplicationHelper
    include ApplicationHelper

    # def authenticate_admin
    #     if current_user && current_user.isAdmin
    #         redirect_to admin_parkings_path
    #     end
    # end
end
