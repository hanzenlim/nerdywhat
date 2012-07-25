class LifeHacker < ActiveRecord::Base
  
  def self.generateLifeHacker
    i=0
    doc = Nokogiri::HTML(open("http://lifehacker.com"))
    doc.xpath("//a[@class='headline']/@href").each do |node|
      #puts node.text
      if(LifeHacker.exists?(i+1))
         user=LifeHacker.find(i+1)
         if(node.text.size < 255 && node.text =~ /http:/)
           user.link=node.text
         else
           user.link="http://www.lifehacker.com" + node.text
         end
         user.save
      else
         user=LifeHacker.new(:link =>node.text)
         user.save
      end
     
      i=i+1
    end
    
    i=0
    doc.xpath("//a[@class='headline']").each do |node|
    #puts node.text
    if(LifeHacker.exists?(i+1))
      user=LifeHacker.find(i+1)
      user.name=node.text
      user.save
    else
      user=LifeHacker.new(:name =>node.text)
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
