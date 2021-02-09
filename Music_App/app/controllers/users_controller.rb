class UsersController < ApplicationControlller

    def new
        @user = user.new
        if @user.save
            :new
        else
            flash[:errors] = @user.errors.full_messages
        end
    end

    def create
        @user = user.new(user_params)
        if user.save
            :new
        else 
            flash.now[:errors] = @user.errors.full_messages
        end
    end

    private

    def user_params
        require(users).permit(:username, :password, :email)
    end

end