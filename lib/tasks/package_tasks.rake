require 'fileutils'
require 'rubygems'
require 'zip/zip'
require 'find'
include FileUtils
task :package do
  rm_rf("/mack_blog_demo", :verbose => true)
  rm_rf(Dir.glob("tmp/*"), :verbose => true)
  rm_rf(Dir.glob("log/*"), :verbose => true)
  cp_r(pwd, "/", :verbose => true)
  rm("/mack_blog_demo/lib/tasks/package_tasks.rake", :verbose => true)
  Dir.glob("/mack_blog_demo/.*").each do |f|
    if f.match(/\/\..+/)
      unless f.match(/\.\./)
        rm_rf(f, :verbose => true)
      end
    end
  end
  
  Zip::ZipFile.open('/mack_blog_demo.zip', Zip::ZipFile::CREATE) do |zipfile|
    Dir.glob("/mack_blog_demo/**/*").each do |f|
      zipfile.add(f[1..f.size], f)
    end
  end
end