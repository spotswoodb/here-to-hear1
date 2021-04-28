class SessionsController < ApplicationController
    
    def new
        if logged_in?
            redirect_to root_path
        end
    end
    
    def create
        user = User.find_by_username(params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            render :login
        end
    end

    def destroy
        session.clear
        redirect_to login_path
    end

end
