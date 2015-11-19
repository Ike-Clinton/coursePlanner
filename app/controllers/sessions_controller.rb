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
      if user.is_advisor == 'true'
        redirect_to "/advisor"
      else
        redirect_to "/student"
      end
      
      # Log in the user and show them their relevant page
    else
      # Create an error message
      flash.now[:warning] = 'Incorrect username/password'
      render 'new'
    end
    
  end
  
  def destroy
    log_out current_user
    redirect_to "/index"
  end
end
