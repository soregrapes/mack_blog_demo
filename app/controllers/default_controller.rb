class DefaultController < Mack::Controller::Base
  
  # /
  def index
  end
  
  def say_hi
    render(:text => "Hi There!", :layout => false)
  end

end
