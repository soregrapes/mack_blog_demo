Mack::Routes.build do |r|
  
  r.resource :posts
  
  r.home_page "/", :controller => :posts, :action => :index
  
  r.defaults
  
end