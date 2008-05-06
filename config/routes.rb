Mack::Routes.build do |r|

  r.resource :uppity_files # Added by rake generate:scaffold name=uppity_file

  r.resource :posts # Added by rake generate:scaffold name=post
  
  r.say_hi "/say_hi", :controller => :default, :action => :say_hi
  
  r.home_page "/", :controller => :posts, :action => :index
  
  r.defaults
  
end
