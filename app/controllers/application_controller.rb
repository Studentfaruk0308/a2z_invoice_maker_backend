class ApplicationController < ActionController::Base

    protect_from_forgery with: :null_session
    include ApplicationHelper

    def welcome
        if !logged_in?
            flash[:notice] = "Please Login"
            redirect_to login_path
        end
    end
end
