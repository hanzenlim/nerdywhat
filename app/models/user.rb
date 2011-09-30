require 'open-uri'
require 'nokogiri'
class User < ActiveRecord::Base
  cattr_accessor :links, :title, :toyota
  cattr_accessor :honda
  
  @@honda="honda"
   @@links= Hash.new
    @@title= Hash.new
  
  def self.returnToyota
    @@toyota="rav4"
    return @@toyota
  end
  
  def self.sayHello
   
    i=0
    doc = Nokogiri::HTML(open("http://reddit.com"))
    doc.xpath("//div[@class='entry unvoted']/p[@class='title']/a[@class='title ']/@href").each do |node|
      #puts node.text
      if(User.exists?(i+1))
         user=User.find(i+1)
         if(node.text.size < 255)
           user.link=node.text
         end
           user.save
      else
         user=User.new(:link =>node.text)
         user.save
      end
     
      i=i+1
    end
    
    i=0
           doc.xpath("//div[@class='entry unvoted']/p[@class='title']/a[@class='title ']").each do |node|
            #puts node.text
            if(User.exists?(i+1))
              user=User.find(i+1)
              user.name=node.text
              user.save
            else
              user=User.new(:name =>node.text)
              user.save
            end
             
              i=i+1
          end
    
  
    # p=0
    #    links.size.times  do 
    #     #puts "#{p} - #{title[p]}"
    #     puts @@inks[p]
    #      puts "\n"
    #     p=p+1
    #    end
  end
end
