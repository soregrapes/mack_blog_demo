Mack::Routes.build do |r|

  r.resource :uploaded_files # Added by rake generate:scaffold name=uploaded_file

  r.resource :posts # Added by rake generate:scaffold name=post
  r.resource :uploads
  
  r.home_page "/", :controller => :posts, :action => :index
  
  r.defaults
  
end
