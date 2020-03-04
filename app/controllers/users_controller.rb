class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def edit
        @user = User.find_by(params[:id])
    end
    
    def update
        @user = User.find_by(params[:id])
        if @user.save
            @user.Update(user_params)
            redirect_to new_users_path
        else
            render :edit
        end
    end

    def create
        @user = User.new(users_params)
        if @user.save
            redirect_to new_users_path
        else
            render :new
        end
    end

    private
    
    def users_params
        params.require(:user).permit(:username, :email, :password)
    end
end
