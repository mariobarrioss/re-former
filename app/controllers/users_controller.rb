class UsersController < ApplicationController
    def new
    end

    def create
        @user = User.new(users_params)
        if @user.save
            redirect_to users_path
        else
            render :new
        end
    end

    private
    
    def users_params
        params.require(:user).permit(:username, :email, :password)
    end
end
