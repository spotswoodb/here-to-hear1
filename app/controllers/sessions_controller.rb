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
            render :new
        end
    end

    def omniauth
        user = User.find_or_create_by(uid: request.env['omniauth.auth'][:uid], provider: request.env['omniauth.auth'][:provider]) do |u|
            u.email = request.env['omniauth.auth'][:info][:email]
            u.username = request.env['omniauth.auth'][:info][:name]
            u.password = SecureRandom.hex(15)
        end
        if user.valid?
            session[:user_id] = user.id
            redirect_to root_path
        else
            redirect_to login_path
        end
    end

    def destroy
        session.clear
        redirect_to login_path
    end

end
