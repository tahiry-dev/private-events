class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(name: params[:session][:name])
    if user
      log_in user
      redirect_to user

    else
      flash.now[:danger] = 'Invalid name, Please try again'
      render :new
    end
  end

  def destroy
    log_out
    flash[:notice] = 'Thanks for your visit'
    redirect_to events_path
  end
end
