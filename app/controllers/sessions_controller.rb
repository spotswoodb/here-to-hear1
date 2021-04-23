class SessionsController < ApplicationController
    
    def login
        user = User.find_by_username(params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(@user)
        else
            render :login
        end
    end

    def logout
        session.clear
        redirect_to :login
    end

end
