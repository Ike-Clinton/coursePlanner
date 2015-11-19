class CoursesController < ApplicationController
    require 'courses_helper.rb'
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
          count+=1
          # Returns {:name=>\"Programming Languages\"
          @selected[:names] << checkbox[1].split(/,/)[0].to_s.gsub(/\d*{:name[{:=>\\"]*/, '').gsub(/\\"/, '*').gsub(/\d*/, '') << '' # Need to figure out what this regex should be
          # Returns  :crn=>\"355\"}
          @selected[:crns] << checkbox[1].split(/,/)[1].to_s.gsub(/[{:crn=>\\"]*/, '').gsub(/[}]/, '')
        end
      end
    end
    
    # Iterate through just the ones that were "selected"
    for i in 0..count
      new = ClassHistory.new
      new.email = @user.email
      new.class_name = @selected[:names].nil? ? 'empty' : @selected[:names].split(/["]/)[i]
      new.crn = @selected[:crns].nil? ? 'empty' : @selected[:crns].split(/ /)[i]
      new.save
    end

    redirect_to "/student"
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
