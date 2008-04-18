Mack::Routes.build do |r|

  r.resource :posts # Added by rake generate:scaffold name=post
  
  r.home_page "/", :controller => :posts, :action => :index
  
  r.defaults
  
end
