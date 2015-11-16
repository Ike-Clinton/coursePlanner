class CoursesController < ApplicationController
    
  def courses_params
    params.require(:user).permit(:email, :name, :academic_class)
  end  
    
  def index
      
  end
  
  def create
    # Grab the parameters from the view
    email = :email
    name = :name
    academic_class = :academic_class
    # Create then save a new active record entry
    @user = User.new(email: email, name: name, academic_class: academic_class)
    @user.save
    # TODO: Create a DB entry for User_data 
    # This will be their classes taken, etc
    
  end
  
  def register
    # I don't think we need any controller code here but I kept this action just in case
  end
  
  def submit_login
      @user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:email])
       # Log in the user and redirect to main page
        log_in(user)
        redirect_to 
      else 
        #Throws error if the email entered does not exists
        flash.now[:danger] = 'Invalid Email Entered'
        render 'new'
      end

  end
  
  def login
    
  end
  
end
