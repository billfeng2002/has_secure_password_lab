class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          flash[:success] = "User successfully created"
          session[:user_id]=@user.id
          redirect_to '/show'
        else
          flash[:error] = "Something went wrong"
          redirect_to '/sign_up'
        end
    end
    
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

    def show
        @user = User.find_by_name(session[:name])
    end
    
end
