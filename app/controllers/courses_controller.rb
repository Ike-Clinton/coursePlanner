class CoursesController < ApplicationController
    
  def index
      
  end
  
  def create
    email = :email
    name = :name
    academic_class = :academic_class
    @user = User.new(email: email, name: name, academic_class: academic_class)
    @user.save
  end
  
  def register
    
  end
  
  def login
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:email])
        log_in(user)
        redirect_to 
      else 
        flash.now[:danger] = 'Invalid Email Entered'
        render 'new'
      end

  end
  
end
