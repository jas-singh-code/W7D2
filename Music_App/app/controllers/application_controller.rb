class ApplicationController < ActionController::Base
    def login!(user)
        session[:session_token] = user.reset_session_token!
    end

    def current_user
        @currentuser ||= User.find_by(session: session[:session_token])
    end

    def logged_in?
        !!current_user
    end

    def logout!
        current_user.reset_session_token! unless current_user.logged_in?
        session[:session_token] = nil
        @current_user = nil
    end
   
end
