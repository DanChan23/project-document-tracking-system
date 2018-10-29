class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_username(params[:username])
  	if user && user.authenticate(params[:password])
    	session[:user_id] = user.id
      @date = DateTime.current
      UserLogin.create(:timestamp => @date, :user_id => session[:user_id])
    	redirect_to "http://localhost:3000/users", notice: "Logged in on #{@date}"
  	else
    	flash.now.alert = "Email or password is invalid"
    	render "new"
    end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to "http://localhost:3000/login", notice: "Logged out!"
  end
end
