class CoursesController < ApplicationController
    
  #Necessary for accessing parameters in the view, etc  
  def courses_params
    params.require(:user).permit(:email, :name, :academic_class, :is_advisor)
  end  
  
  def class_history_params
    params.require(:classes).permit(:email, :class_name, :crn)
  end
    
  def index
      
  end
  
  # Create CRUD operation
  def create

  end
  
  # Action for submitting the register form
  def submit_register_user
    # Handle the register_user part of the form
    if User.find_by email: params[:email]
      flash[:warning] = "User already exists!"
      redirect_to "/register_user" and return
    end
    # Otherwise, create the user in the DB
    @user = User.create!(courses_params)
    # Log them in since they have an account
    # TODO Add code to handle case where user creates account
    # but does not register for classes
    log_in @user
    if @user
      # Currently, a user can just declare they are an advisor
      # TODO: Add trusted advisor list to prevent students from
      # escalating privs
      if @user.is_advisor == "true"
        redirect_to "/advisor"
      else
        redirect_to "/register_classes"
      end
    end
  end
  
  def submit_register_classes
    # grab a reference to the user who just registered/logged in
    @user = current_user
    # here we want to iterate through each check box from the form
    @classes = params[:classes]
    
    @classes.each do |checkbox_array|
      checkbox_array.each do |checkbox|
        ClassHistory.create!(@user.email, checkbox.class_name, checkbox.crn)
      end
    end
  end
  
  def register_user
    
  end
  
  def register_classes
    
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
    # TODO Redirect to /register if they have not registered their classes yet
    @classes = ClassHistory.where(email: current_user.email)
    
  end
  
  def advisor
    
  end
  
end
