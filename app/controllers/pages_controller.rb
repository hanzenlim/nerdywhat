require 'open-uri'
class PagesController < ApplicationController
  def home
    @science="science"
    
 
    
   # User.sayHello
    @title=Child
    @hacker=HackerNew
  end   

    
 # end
  def bading
    first=User.new(:name =>"Michael Hartly", :link=>"www.goddddgole.com")
    
    
  end
  
  def about
    
  end
  

end
