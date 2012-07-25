class Redmondpie < ActiveRecord::Base
  
  def self.generateRedmondPie
     i=0
     doc = Nokogiri::HTML(open("http://www.redmondpie.com"))
     doc.xpath("//div[@class='posthead']/h2/a/@href").each do |node|
       #puts node.text
       if(Redmondpie.exists?(i+1))
          user=Redmondpie.find(i+1)
          if(node.text.size < 255 && node.text =~ /http:/)
            user.link=node.text
          else
            user.link="http://www.redmondpie.com" + node.text
          end
          user.save
       else
          user=Redmondpie.new(:link =>node.text)
          user.save
       end

       i=i+1
     end

     i=0
     doc.xpath("//div[@class='posthead']/h2/a").each do |node|
     #puts node.text
     if(Redmondpie.exists?(i+1))
       user=Redmondpie.find(i+1)
       user.name=node.text
       user.save
     else
       user=Redmondpie.new(:name =>node.text)
       user.save
     end

       i=i+1
   end

   end
end
