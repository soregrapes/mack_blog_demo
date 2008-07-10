class DefaultController
  include Mack::Controller
  
  # /
  def index
  end
  
  def say_hi
    render(:text, "Hi There!", :layout => false)
  end

end
