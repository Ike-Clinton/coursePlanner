class CoursesController < ApplicationController
    
  def courses_params
    params.require(:user).permit(:email, :name, :academic_class, :is_advisor)
  end  
    
  def index
      
  end
  
  def create
    @user = User.create!(user_params)
    flash[:warning] = "#{@user.email} was successfully created."
    redirect_to "/student"

  end
  
  def submit_register
     # Grab the parameters from the view
    user = :user
    email = :email
    name = :name
    academic_class = :academic_class
    is_advisor = :is_advisor
    # Create then save a new active record entry
    @user = User.create!(courses_params)
    redirect_to "/student"
  end
  
  def register
    
  end
  
  def submit_login
      user = User.find_by email: params[:email]
      # Throws error if the email entered does not exists
      if user
        if user.is_advisor == "true"
          redirect_to "/advisor"
        else
          redirect_to "/student" 
        end
    else
      flash[:warning] = 'User does not exist!'
      redirect_to "/login"
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
