class CoursesController < ApplicationController
  # TODO: Clean up some pieces of code that aren't necessary
  #Necessary for accessing parameters in the view, etc  
  def courses_params
    params.require(:user).permit(:email, :name)
  end  
  def class_history_params
    params.require(:classes).permit(:class_name, :crn)
  end
  def index
      
  end

  def create

  end
  
  # Action for submitting the register form
  def submit_register_user
    # Make sure user doesn't already exist before registering
    if User.exists?(:email => params[:user][:email])
      flash[:warning] = "User already exists!"
      redirect_to "/register_user" and return
    end
    academic_class = "Deprecated"
    is_advisor = "false"
    # Otherwise, create the user in the DB
    @user = User.create!(email: params[:user][:email], name: params[:user][:name], academic_class: academic_class, is_advisor: is_advisor)
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
  
  # Action for submitting the checkbox form for classes
  def submit_register_classes
    # grab a reference to the user who just registered/logged in
    @user = current_user
    @classes_taken = ClassHistory.where(email: current_user.email)
    # Classes is a hash of all the checkbox form data
    @classes = params[:classes]
    # Each element in @classes is of the form:
    # c1"=>["0", "{:name=>\"Programming Languages\", :crn=>\"355\"}"]
    # Store all of the boxes that were checked
    @selected = {}
    @selected[:names] = ""
    @selected[:crns] = ""
    
    # Iterate through all the checkbox param data
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
    for i in 0..@selected[:names].split(/["]/).length-1
      new = ClassHistory.new
      new.email = @user.email
      # Grab the class_name from the checkbox form data
      # see above for the explanation of the crazy regex
      new.class_name = @selected[:names].nil? ? 'empty' : @selected[:names].split(/["]/)[i]
      new.crn = @selected[:crns].nil? ? 'empty' : @selected[:crns].split(/\s/)[i+1]
      course = CSCI.find_by_crn(new.crn)
      
      # If the course lookup succeeds
      if course.nil? == false
        # If the course has pre_reqs
        if course.pre_reqs.nil? == false
          # Grab the list of pre_reqs we found
          new.pre_reqs = course.pre_reqs
          # Iterate through the csv list (most have just one)
          new.pre_reqs.split(/,/).each do |req|
            # If they have taken the class,
            if @classes_taken.find_by(crn: req)
              # TODO add a counter here to make sure ALL reqs are met not just one
              new.save # They can register the class
            else
              flash[:warning] = "You do not meet one or more of the pre-requisites for one of the classes you attempted to register for!"
            end
          end
        else # If a class has no pre_reqs then save it to DB
          new.save
        end
      end
    end

    redirect_to "/student"
  end

  
  def student
    @user = current_user
    unless @user
      flash[:warning] = "You must be logged in to do that!"
      redirect_to "/index" and return
    end
    unless @user.is_advisor == 'false'
      flash[:warning] = "You are too old to be a student!"
      redirect_to "/advisor" and return
    end
    @comment = @user.comments.new
    
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
    unless @user
      flash[:warning] = "You must be logged in to do that!"
      redirect_to "/index" and return
    end
    @my_student = User.find_by(email: params[:user])
    @comment = @user.comments.new
    # User must be logged in to visit this page (valid token in session)

    
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
  
  def submit_advisor_add_classes
    # grab a reference to the user who just registered/logged in
    @user = current_user
    @classes_taken = ClassHistory.where(email: params[:user])
    @my_student = User.find_by(email: params[:user])
    unless @user
      flash[:warning] = "You must be logged in to do that!"
      redirect_to "/index" and return
    end
    # Classes is a hash of all the checkbox form data
    @classes = params[:classes]
    # Each element in @classes is of the form:
    # c1"=>["0", "{:name=>\"Programming Languages\", :crn=>\"355\"}"]
    # Store all of the boxes that were checked
    @selected = {}
    @selected[:names] = ""
    @selected[:crns] = ""
    
    # Iterate through all the checkbox param data
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
    for i in 0..@selected[:names].split(/["]/).length-1
      new = ClassHistory.new
      new.email = params[:user]
      new.class_name = @selected[:names].nil? ? 'empty' : @selected[:names].split(/["]/)[i]
      new.crn = @selected[:crns].nil? ? 'empty' : @selected[:crns].split(/\s/)[i+1]
      course = CSCI.find_by_crn(new.crn)
      
      # If the course lookup succeeds
      if course.nil? == false
        # If the course has pre_reqs
        if course.pre_reqs.nil? == false
          # Grab the list of pre_reqs we found
          new.pre_reqs = course.pre_reqs
          # Iterate through the csv list (most have just one)
          new.pre_reqs.split(/,/).each do |req|
            # If they have taken the class,
            if @classes_taken.find_by(crn: req)
              # TODO add a counter here to make sure ALL reqs are met not just one
              new.save # They can register the class
            else
              flash[:warning] = "The student does not meet one or more of the pre-requisites for one of the classes you attempted to register him/her for!"
            end
          end
        else # If a class has no pre_reqs then save it to DB
          new.save
        end
      end
      
    end
    redirect_to "/view_student?user=" << @my_student.email
  end
  
  def advisor_add_classes
    @my_student = User.find_by(email: params[:user])
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
