class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update]

    def new
        @user = User.new
    end

    def edit
    end

    def update
        if @user.update(users_params)
            redirect_to edit_user_path
        else
            render :edit
        end
    end

    def create
        #@user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
        @user = User.new(users_params)
        if @user.save
            redirect_to new_user_path
        else
            render :new
        end
    end

    private
        def set_user
            @user = User.find(params[:id])
        end

        def users_params
            params.require(:user).permit(:username, :email, :password, :id)
        end
end
