Mack::Routes.build do |r|

  r.resource :uppity_files # Added by rake generate:scaffold name=uppity_file
  
  r.with_options(:controller => :posts) do |map|
    map.total_posts "/posts/total_posts", :action => :total_posts
    map.home_page "/"
  end
  
  r.resource :posts # Added by rake generate:scaffold name=post
  
  r.say_hi "/say_hi", :controller => :default, :action => :say_hi
  
  r.defaults
  
end
