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
  
  def submit_register
    # I don't think we need any controller code here but I kept this action just in case
  end
  
  def register
    
  end
  
  def submit_login
      @user = User.find_by(email: params[:session][:email].downcase)
        redirect_to 
        #Throws error if the email entered does not exists
        flash.now[:danger] = 'Invalid Email Entered'
        render 'new'

  end
  
  def login
    
  end
  

  
end
