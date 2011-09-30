require 'nokogiri'
require 'open-uri'
desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
 
   puts "hello"
   user=User.new(:name=>"hello there", :link=> "www.gogole.com")
   user.save
   
   
end