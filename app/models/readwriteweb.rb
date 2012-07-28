class Readwriteweb < ActiveRecord::Base
  
  def self.generateReadwriteweb
     i=0
     doc = Nokogiri::HTML(open("http://www.readwriteweb.com"))
     doc.xpath("//h4/a/@href").each do |node|
       if(Readwriteweb.exists?(i+1))
          user=Readwriteweb.find(i+1)
          if(node.text.size < 255 && node.text =~ /http:/)
            user.link=node.text
          else
            user.link="http://www.readwriteweb.com" + node.text
          end
          user.save
       else
         if(node.text.size < 255 && node.text =~ /http:/)
           user=Readwriteweb.new(:link =>node.text)
         else
           user=Readwriteweb.new(:link =>"http://www.readwriteweb.com" + node.text)
         end       
          user.save
       end

       i=i+1
     end

     i=0
     doc.xpath("//h4/a").each do |node|
     if(Readwriteweb.exists?(i+1))
       user=Readwriteweb.find(i+1)
       user.name=node.text
       user.save
     else
       user=Readwriteweb.new(:name =>node.text)
       user.save
     end
       i=i+1
   end

   end
end
