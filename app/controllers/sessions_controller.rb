class SessionsController < ApplicationController
    def create
        @user = User.find_by_name(params[:user][:name])
        if(@user.authenticate(params[:user][:password]))
            session[:user_id]=@user.id
            redirect_to '/show'
        end
    end
    
end
