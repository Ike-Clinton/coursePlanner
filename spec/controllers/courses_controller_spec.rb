require 'rails_helper.rb'
require 'spec_helper.rb'

describe CoursesController do
    
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