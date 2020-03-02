class UsersController < ApplicationController
    def new
    end

    def create
    end

    private
    
    def users_param
        params.require(:user).permit(:username, :email, :password)
    end
end
