require 'nokogiri'
require 'open-uri'
desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
 
   puts "hello"
   Child.sayHello
   
   
end