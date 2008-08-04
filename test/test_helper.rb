require 'rubygems'
require "test/unit"
require 'fileutils'

ENV["MACK_ENV"] = "test"
ENV["MACK_ROOT"] = File.join(File.dirname(__FILE__), "..")
# load the mack framework:
load(File.join(File.dirname(__FILE__), "..", "Rakefile"))
require 'mack'

# place common methods, assertions, and other type things in this file so
# other tests will have access to them.

class Test::Unit::TestCase
  
end

class PostFactory
  include Mack::Data::Factory
  
  field :title, "", :content => :alpha, :length => 50
  field :email, "", :content => :email
  field :body, "", :content => :alpha_numeric, :length => 1000
  
end
