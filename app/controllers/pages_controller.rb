require 'open-uri'
class PagesController < ApplicationController
  def home
    @science="science"
    
 
    
   # User.sayHello
    @reddit=Child
    @hacker=HackerNew
    @hackerpic=HackerPic
    @lifehacker=LifeHacker
    @makeuseof=Makeuseof
    @techcrunch=TechCrunch
    @mashable=Mashable
    @redditprog=RedditProgramming
    @redmondpie=Redmondpie
    @slickdeals=Slickdeal
    @readwriteweb=Readwriteweb
  end   

    
 # end
  def bading
    first=User.new(:name =>"Michael Hartly", :link=>"www.goddddgole.com")
    
    
  end
  
  def about
    
  end
  
  def _left
    
  end
  

end
