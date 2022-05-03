class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(username: params[:username])
  	if user.authenticate(params[:password])
  	  session[:user_id] = user.id 
  	  flash[:success] = "Welcome, #{user.username}"
  	  redirect_to '/'
  	else
  	  flash[:error] = 'Incorrect Password'
  	  render :new 
  	end
  end

  def destroy
  	session[:user_id] = nil 
  	flash[:success] = "You have successfully logged out!"
  	redirect_to '/'
  end


end