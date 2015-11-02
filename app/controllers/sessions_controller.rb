class SessionsController < ApplicationController
  def login
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      log_in user
      redirect_to user
    else
      flash[:danger] = 'Invalid User Email Given'
      render 'new'
    end
  end
end
