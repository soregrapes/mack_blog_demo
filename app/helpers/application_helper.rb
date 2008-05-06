require 'benchmark'
module ApplicationHelper
  
  def render_url(url)
    puts Benchmark.measure {
      return Rack::MockRequest.new(mack_app).get(url).body
    }
  end
  
  def mack_app
    ivar_cache do
      Mack::Utils::Server.build_app
    end
  end
  
end
