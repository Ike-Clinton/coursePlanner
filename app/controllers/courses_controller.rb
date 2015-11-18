class CoursesController < ApplicationController
    
  #Necessary for accessing parameters in the view, etc  
  def courses_params
    params.require(:user).permit(:email, :name, :academic_class, :is_advisor)
  end  
  
  def class_history_params
    params.require(:classes).permit(:class_name, :crn)
  end
    
  def index
      
  end
  
  # Create CRUD operation
  def create
    @user = User.create!(user_params)
    flash[:warning] = "#{@user.email} was successfully created."
    redirect_to "/student"
  end
  
  # Action for submitting the register form
  def submit_register
    # Handle the register_user part of the form
    if params[:commit] == "register_user"
      if User.find_by email: params[:email]
        flash[:warning] = "User already exists!"
        redirect_to "/register" and return
      end
      # Otherwise, create the user in the DB
      @user = User.create!(courses_params)
      if @user
        # Currently, a user can just declare they are an advisor
        # TODO: Add trusted advisor list to prevent students from
        # escalating privs
        if @user.is_advisor == "true"
          redirect_to "/advisor"
        else
          redirect_to "/student"
        end
      end
    
    else
      @class_history.each do |checkbox|
        ClassHistory.create!(@user.email, checkbox)
      end
    end

  end
    

  
  def register
    
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
    @classes = ClassHistory.where(email: current_user.email)
  
  end
  
  def advisor
    
  end
  
end
