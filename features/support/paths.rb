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
    
    when /Course Planner Register page/
      '/register'
      
     when /Course Planner Login page/
      '/login'
      
      when /Course Planner Advisor page/
        'advisor'
    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)