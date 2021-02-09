class SessionsController < ApplicationController
#login and logout

    def new  #renders form to create new session. in this case log in
        render :new
    end

    def create  #logs you in; creates a new session
        #make sure username and pass are correct
            #if success: generate a new token
        @user = User.find_by_crenditials(params[:user][:username], params[:user][:password])
        if @user
            login!(@user)
            render json: @user #log of all users

        else
            flash.now[:errors] = ["Invalid Credentials"]
            render :new
        end

    end

    def destroy
        #set session token to nil(resent ses token)
        logout!
        redirect_to users_url
    end

end
