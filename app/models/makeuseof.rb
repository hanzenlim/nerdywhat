class Makeuseof < ActiveRecord::Base
  
  def self.generateMakeuseof
    i=0
    doc = Nokogiri::HTML(open("http://www.makeuseof.com"))
    doc.xpath("//article[@class='hentry']/header/h2[@class='entry-title']/a/@href").each do |node|
      #puts node.text
      if(Makeuseof.exists?(i+1))
         user=Makeuseof.find(i+1)
         if(node.text.size < 255 && node.text =~ /http:/)
           user.link=node.text
         else
           user.link="http://www.makeuseof.com" + node.text
         end
         user.save
      else
         user=Makeuseof.new(:link =>node.text)
         user.save
      end
     
      i=i+1
    end
    
    i=0
    doc.xpath("//article[@class='hentry']/header/h2[@class='entry-title']/a").each do |node|
    #puts node.text
    if(Makeuseof.exists?(i+1))
      user=Makeuseof.find(i+1)
      user.name=node.text
      user.save
    else
      user=Makeuseof.new(:name =>node.text)
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
    
    p=i
    
    # second page for make use of
    doc = Nokogiri::HTML(open("http://www.makeuseof.com/page/2/"))
    doc.xpath("//article[@class='hentry']/header/h2[@class='entry-title']/a/@href").each do |node|
      #puts node.text
      if(Makeuseof.exists?(i+1))
         user=Makeuseof.find(i+1)
         if(node.text.size < 255 && node.text =~ /http:/)
           user.link=node.text
         else
           user.link="http://www.makeuseof.com" + node.text
         end
         user.save
      else
         user=Makeuseof.new(:link =>node.text)
         user.save
      end
     
      i=i+1
    end
    
    i=p
    doc.xpath("//article[@class='hentry']/header/h2[@class='entry-title']/a").each do |node|
    #puts node.text
    if(Makeuseof.exists?(i+1))
      user=Makeuseof.find(i+1)
      user.name=node.text
      user.save
    else
      user=Makeuseof.new(:name =>node.text)
      user.save
    end
   
      i=i+1
  end
  
  end
end
