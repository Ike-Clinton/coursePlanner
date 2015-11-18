class CoursesController < ApplicationController
    
  #Necessary for accessing parameters in the view, etc  
  def courses_params
    params.require(:user).permit(:email, :name, :academic_class, :is_advisor)
  end  
    
  def index
      
  end
  
  # Create CRUD operation
  def create
    @user = User.create!(user_params)
    flash[:warning] = "#{@user.email} was successfully created."
    redirect_to "/student"
  end
  
  def submit_register
     # If the user already exists, inform the user and return
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
          redirect_to "/advisor" and return
        else
          redirect_to "/student" and return
        end
    end
    # Shouldn't get here
    redirect_to "/error" and return
  end
  
  def register
    
  end
  
  def submit_login
      # Find the user by their email
      # TODO: Add password based auth (on icebox for now)
      @user = User.find_by email: params[:email]
      session[:user] = @user
      # Flash error if email does not exist and redirectes back to login
      if @user
        # If the user exists, display the appropriate view based on permissions
        if @user.is_advisor == "true" 
          redirect_to "/advisor"
        else
          redirect_to "/student" 
        end
    else
      # Error message for when user != true
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
    @email = session[:user].email
    @classes = ClassHistory.where(email: @email)
  
  end
  
  def advisor
    
  end
  
end
