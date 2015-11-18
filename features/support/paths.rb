# Taken from the cucumber-rails project.

module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
    when /Course Planner Welcome page/
      '/'
    
    when /Course Planner User Registration page/
      '/register_user'
      
    when /Course Planner Class Registration page/
      '/register_classes'
      
     when /Course Planner Login page/
      '/login'
      
      when /Course Planner Advisor page/
        '/advisor'
        
      when /Course Planner Student page/
        '/student'
    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)