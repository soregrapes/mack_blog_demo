# Using this file you can add gems dependencies to your application.
# gem_name, options
# gem_name is the name of the gem you want to add.
# :version, optional, is the version of the gem you want to use.
# :libs, optional, is an array of files you want to require.
# :source, options, is the source you want to use to install a particular gem.
require_gems do |gem|
  # examples:
  # gem.add :redgreen, :version => "1.2.2", :libs => :redgreen
  # gem.add :termios
  # gem.add :rubyzip, :source => "http://gems.rubyforge.org"
  # gem.add :markaby, :version => "0.5.0", :libs => :markaby
  gem.add "pdf-writer", :version => "1.1.8", :libs => "pdf/writer"
end
