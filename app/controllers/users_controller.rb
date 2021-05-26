class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def new 
        if !logged_in?
            @user = User.new 
        else 
            redirect_to root_path
        end 
    end

      def create
          @user = User.new(user_params)
          if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
          else 
              render :new
          end 
      end 

    def show
        @user = User.find_by_id(params[:id])
        if @user.blank?
            redirect_to new_user_path
        end
    end

    def edit
        @user = User.find_by_id(params[:id])
    end

    def update 
        if @user.update(user_params)
            redirect_to user_path(@user)
        else 
            render :edit
        end 
    end 

    def profile
        redirect_to user_path(current_user)
    end

    def destroy
        @user = User.find_by_id(params[:id])
        @user.destroy
        redirect_to users_path
    end 

private

  def user_params
    params.require(:user).permit(:name, :email, :username, :password)
  end

end