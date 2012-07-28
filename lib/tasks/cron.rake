require 'nokogiri'
require 'open-uri'
desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
 
   puts "hello"
    Child.sayHello
    HackerNew.generateHackerNews
    HackerPic.generateHackerPics
    LifeHacker.generateLifeHacker
    Makeuseof.generateMakeuseof
    TechCrunch.generateTechCrunch
    Mashable.generateMashable
    RedditProgramming.generateRedditProgramming
    Redmondpie.generateRedmondPie
    Slickdeal.generateSlickdeals
    Readwriteweb.generateReadwriteweb
   
   
end