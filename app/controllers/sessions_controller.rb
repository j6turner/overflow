class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      flash[:notice] ="Welcome  #{@user.name}"
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash[:alert] = "There was a problem loggin' yo' face in."
      redirect_to :back
    end
  end

  def delete

  end

end
