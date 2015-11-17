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

  end
  
  def submit_register
    # I don't think we need any controller code here but I kept this action just in case
    redirect_to "/student"
  end
  
  def register
    
  end
  
  def submit_login
      user = User.find_by email: params[:email]
      # Throws error if the email entered does not exists
      if user
        if user.email == "mv@citadel.edu"
          redirect_to "/advisor"
        else
          redirect_to "/student"  
        end
    else
      flash.now[:danger] = 'User does not exist!'
    end
      
      

  end
  
  def login
    
  end
  
  
  # Unused
  def new
    
  end
  
  def edit
  
  end
  
  def update
    
  end
  
  def student
  
  end
  
  def advisor
    
  end
  
end
