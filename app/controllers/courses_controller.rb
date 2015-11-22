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

  end
  
  # Action for submitting the register form
  def submit_register_user
    # Make sure user doesn't already exist before registering
    if User.exists?(:email => params[:user][:email])
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
    # Classes is a hash of all the checkbox form data
    @classes = params[:classes]
    # Each element in @classes is of the form:
    # c1"=>["0", "{:name=>\"Programming Languages\", :crn=>\"355\"}"]
    # Store all of the boxes that were checked
    @selected = {}
    @selected[:names] = ""
    @selected[:crns] = ""
    
    # Iterate through all the checkbox param data
    count = 0 # counter for loop
    @classes.each do |checkbox_array|
      checkbox_array.each do |checkbox|
        if !checkbox[1].nil? # if left unchecked
          # Returns {:name=>\"Programming Languages\"
          @selected[:names] << checkbox[1].split(/,/)[0].to_s.gsub(/\d*{:name[{:=>\\"]*/, '').gsub(/\\"/, '*').gsub(/\d*/, '') << '' # Need to figure out what this regex should be
          # Returns  :crn=>\"355\"}
          @selected[:crns] << checkbox[1].split(/,/)[1].to_s.gsub(/[{:crn=>\\"]*/, '').gsub(/[}]/, '')
        end
      end
    end
    
    # Iterate through just the ones that were "selected"
    for i in 0..@selected[:names].split(/["]/).length
      new = ClassHistory.new
      new.email = @user.email
      new.class_name = @selected[:names].nil? ? 'empty' : @selected[:names].split(/["]/)[i]
      new.crn = @selected[:crns].nil? ? 'empty' : @selected[:crns].split()[i]
      new.save
    end

    redirect_to "/student"
  end

  
  def student
    
    @user = current_user
    unless @user
      flash[:warning] = "You must be logged in to do that!"
      redirect_to "/index" and return
    end
    @classes_taken = ClassHistory.where(email: current_user.email)
    @classes_required = CSCI.all
        
    # Loop through each class in the yml, remove all the ones already taken
    @classes_taken.each do |item|
      @classes_required.each do |item2|
        if item.class_name == item2.class_name
            @classes_required.delete(item2)
        end
      end
    end
  end
  
  def advisor
    # Reference to logged in user
    @user = current_user
    # User must be logged in to visit this page (valid token in session)
    unless @user
      flash[:warning] = "You must be logged in to do that!"
      redirect_to "/index" and return
    end
    
    # Only lets advisors access this page
    unless @user.is_advisor == 'true'
      flash[:warning] = "You must be an advisor to do that!"
      redirect_to "/index" and return
    end
    # Returns a list of all non-advisor users
    @my_students = User.where(is_advisor: 'false')
    
  end
  
  def view_student
    # Reference to logged in user
    @user = current_user
    # User must be logged in to visit this page (valid token in session)
    unless @user
      flash[:warning] = "You must be logged in to do that!"
      redirect_to "/index" and return
    end
    
    # Only lets advisors access this page
    unless @user.is_advisor == 'true'
      flash[:warning] = "You must be an advisor to do that!"
      redirect_to "/index" and return
    end
    # grab the email from the params hash "?user=iclinton@citadel.edu"
    user_email = params[:user]
    @name = User.find_by(email: user_email).name
    # TODO Redirect to /register if they have not registered their classes yet
    @classes_taken = ClassHistory.where(email: user_email)
    # Return a list of all class in the cscis.yml file
    @classes_required = CSCI.all
        
    # Loop through each class in the yml, remove all the ones already taken
    @classes_taken.each do |item|
      @classes_required.each do |item2|
        if item.class_name == item2.class_name
            @classes_required.delete(item2)
        end
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
end
