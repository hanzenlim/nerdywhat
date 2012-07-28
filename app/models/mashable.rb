class Mashable < ActiveRecord::Base
  def self.generateMashable
     i=0
     doc = Nokogiri::HTML(open("http://mashable.com"))
     doc.xpath("//div[@class='entry-title summary']/h2/a/@href").each do |node|
       #puts node.text
       if(Mashable.exists?(i+1))
          user=Mashable.find(i+1)
          if(node.text.size < 255 && node.text =~ /http:/)
            user.link=node.text
          else
            user.link="http://mashable.com" + node.text
          end
          user.save
       else
          user=Mashable.new(:link =>node.text)
          user.save
       end

       i=i+1
     end

     i=0
     doc.xpath("//div[@class='entry-title summary']/h2/a").each do |node|
     #puts node.text
     if(Mashable.exists?(i+1))
       user=Mashable.find(i+1)
       user.name=node.text
       user.save
     else
       user=Mashable.new(:name =>node.text)
       user.save
     end

       i=i+1
   end
   end
end
