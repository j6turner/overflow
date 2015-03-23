class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{current_user.email}"
      redirect_to "/"
    else
      flash[:alert] = "There was a problem loggin' yo' face in."
      redirect_to :back
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
