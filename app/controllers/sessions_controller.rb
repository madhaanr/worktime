class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by username: params[:username]
    if user.nil? or not user.authenticate params[:password]
      redirect_to :back, notice: "Username and/or password mismatch"
    else
      session[:user_id] = user.id
      redirect_to :root
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end
end