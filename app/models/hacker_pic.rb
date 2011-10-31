class HackerPic < ActiveRecord::Base
 
  def self.generateHackerPics
   
    i=0
    doc = Nokogiri::HTML(open("http://www.reddit.com/r/pics/"))
    doc.xpath("//div[@class='entry unvoted']/p[@class='title']/a[@class='title ']/@href").each do |node|
      #puts node.text
      if(HackerPic.exists?(i+1))
         user=HackerPic.find(i+1)
         if(node.text.size < 255 && node.text =~ /http:/)
           user.link=node.text
         else
           user.link="http://www.reddit.com" + node.text
         end
         user.save
      else
         user=HackerPic.new(:link =>node.text)
         user.save
      end
     
      i=i+1
    end
    
    i=0
    doc.xpath("//div[@class='entry unvoted']/p[@class='title']/a[@class='title ']").each do |node|
    #puts node.text
    if(HackerPic.exists?(i+1))
      user=HackerPic.find(i+1)
      user.name=node.text
      user.save
    else
      user=HackerPic.new(:name =>node.text)
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
