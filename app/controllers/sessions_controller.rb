class SessionsController < ApplicationController
    def new
    end

    def create
      user = User.find_by(email: login_params[:email])
      if user && user.authenticate(login_params[:password])
        session[:user_id] = user.id
        redirect_to '/'
      else
        flash[:error] = "Sorry, we don't recognize that username/password."
        render 'new'
      end
    end

    def destroy
      session.delete(:user_id)
      redirect_to login_path
    end

    private

    def login_params
      params.require(:login).permit(:email, :password)
    end

    def forgot_password
    end

end
