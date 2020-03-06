class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def edit
        @user = User.find_by(params[:id])
    end

    def update
        @user = User.find_by(params[:id])
        if @user.update(users_params)
            redirect_to edit_user_path
        else
            render :edit
        end
    end

    def create
        #Manual form entry
        #@user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
        @user = User.new(users_params)
        if @user.save
            redirect_to new_user_path
        else
            render :new
        end
    end

    private

        def current_user
            @user = User.find_by(params[:id])
        end
        
        def users_params
            params.require(:user).permit(:username, :email, :password)
        end
end
