class SessionsController < ApplicationController
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      # Log in the user and show them their relevant page
    else
      # Create an error message
      flash.now[:warning] = 'Incorrect username/password'
      render 'new'
    end
    
  end
  
  def destroy
    
  end
end
