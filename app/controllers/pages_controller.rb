require 'open-uri'
class PagesController < ApplicationController
  def home
    @science="science"
    
 
    
   # User.sayHello
    @title=Child.all
  end   

    
 # end
  def bading
    first=User.new(:name =>"Michael Hartly", :link=>"www.goddddgole.com")
    
    
  end
  

end
