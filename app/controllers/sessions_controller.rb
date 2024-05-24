class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:username] == ENV["ADMIN_USERNAME"] && params[:password] == ENV["ADMIN_PASSWORD"]
      session[:admin] = true
      redirect_to root_path, notice: "Logged in successfully"
    else
      flash.now[:alert] = "Invalid credentials"
      render :new
    end
  end

  def destroy
    session[:admin] = nil
    redirect_to root_path, notice: "Successfully logged out!"
  end
end
