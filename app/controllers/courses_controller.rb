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
    
    email = :email
    name = :name
    academic_class = :academic_class
    is_advisor = :is_advisor
    
    if User.find_by email: params[:email]
      flash[:warning] = "User already exists!"
      redirect_to "/register" and return
    end
    
    @user = User.create!(courses_params)
    if @user
        if @user.is_advisor == "true"
          redirect_to "/advisor" and return
        else
          redirect_to "/student" and return
        end
    end
    redirect_to "/student" and return
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
