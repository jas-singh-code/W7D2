class UsersController < ApplicationController 

    def new             #just gives sign up form to fill out
        @user = User.new
        render :new
    end

    def create  #actually sigining you up
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            redirect_to #music page
        else 
            flash.now[:errors] = @user.errors.full_messages
            render :new

        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :email)
    end

end