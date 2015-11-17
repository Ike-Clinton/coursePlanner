require 'rails_helper.rb'

describe CoursesController do
    
  describe "#submit_login" do
    context "When a student provides his email" do
      it "should log that student in and redirect to his profile" do
        @student_id = '1234'
        @student_email = 'iclinton@citadel.edu'
        @user = double('fake_user', :email => 'iclinton@citadel.edu')
        
        expect(User).to receive(:find_by).with(@student_email).and_return(@user)
        
        get :student, :id => @student_id
        expect(response).to render_template(:student)
        
      end
    end
    
    context "When an advisor provides his email" do
      it "should log that advisor in and redirect to the advisor view" do
        @advisor_id = '5678'
        @advisor_email = 'mv@citadel.edu'
        @user = double('fake_user', :email => 'mv@citadel.edu')
        
        expect(User).to receive(:find_by).with(@advisor_email).and_return(@user)
        
        get :advisor, :id => @advisor_id
        expect(response).to render_template(:advisor)
      end
    end
    
    context "When a specified user provides his email but has no account registered" do
      it "should redirect back to login screen, and tell him the account doesn't exist" do
       @student_id = '0000'
        @student_email = 'notreal@citadel.edu'
        @user = double('fake_user', :email => 'notreal@citadel.edu').as_null_object
        
        expect(User).to receive(:find_by).with(@student_email).and_return(nil)
        
        get :student, :id => @student_id
        expect(response).to render_template(:student)
      end
    end
  end
   
  describe "#submit_register" do
      
    context "When a specified student provides his information" do
      it "should create a student account for him with that information, and redirect to the student view" do
      
      end
    end
    
    context "When a specified advisor provides his information" do
      it "should create an advisor account for him with that information, and redirect to the advisor view" do
      
      end
    end
    
    context "When a specified user provides his information but already has an account" do
      it "should log tell that user that the account already exists with that email" do
      
      end
    end
       
  end
  
  describe "#create" do
       
  end
  
  describe "#student" do
    context "When a specified student logs in with his email address" do
      it "should show a list of all the classes the student has taken" do
      
      end
      
      it "should show a suggested course plan for the student's next semester" do
      
      end
    end

  end
  
  describe "#advisor" do
       context "When a specified advisor logs in with his email address" do
      it "should show a list of all the students under that advisor's control" do
      
      end
      
      it "should show a list of completed course plans for each student" do
      
      end
    end
  end
  
end