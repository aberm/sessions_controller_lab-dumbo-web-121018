class SessionsController < ApplicationController

  helper_method :logged_in?

  def new
    @user = user
    render :new
  end

  def create
    if params[:name].blank? || params[:name].nil?
      redirect_to sessions_new_path
    else
      user = params[:name]
      session[:name] = user
      redirect_to root_path
    end
  end

  def destroy
    session.delete(:name)
    redirect_to login_path
  end

  def logged_in?
    !!user
  end

  def user
    session[:name] ||= nil
  end
end
