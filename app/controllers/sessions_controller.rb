class SessionsController < ApplicationController
  
  def session_params
    params.require(:user).permit(:email, :name, :academic_class, :is_advisor, :id)
  end
  
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      log_in user
      if user.is_advisor == 'false'
        redirect_to "/student"
      else
        redirect_to "/advisor"
      end
      
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
