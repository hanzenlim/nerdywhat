class TechCrunch < ActiveRecord::Base
  
  def self.generateTechCrunch
     i=0
     doc = Nokogiri::HTML(open("http://techcrunch.com"))
     doc.xpath("//h2[@class='headline']/a/@href").each do |node|
       #puts node.text
       if(TechCrunch.exists?(i+1))
          user=TechCrunch.find(i+1)
          if(node.text.size < 255 && node.text =~ /http:/)
            user.link=node.text
          else
            user.link="http://www.techcrunch.com" + node.text
          end
          user.save
       else
          user=TechCrunch.new(:link =>node.text)
          user.save
       end

       i=i+1
     end

     i=0
     doc.xpath("//h2[@class='headline']/a").each do |node|
     #puts node.text
     if(TechCrunch.exists?(i+1))
       user=TechCrunch.find(i+1)
       user.name=node.text
       user.save
     else
       user=TechCrunch.new(:name =>node.text)
       user.save
     end

       i=i+1
   end

   end
end
