require 'rubygems'
require 'rack'
require 'fileutils'


begin
  require 'mack'
rescue Exception => e
  raise e
  # require File.join(ENV["MACK_ROOT"] ||= FileUtils.pwd, "..", "mack", "mack")
end