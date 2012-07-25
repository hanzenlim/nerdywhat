class Slickdeal < ActiveRecord::Base
  
  def self.generateSlickdeals
     i=0
     p=0
     listExpired=[]
     doc = Nokogiri::HTML(open("http://slickdeals.net"))
      doc.xpath("//a[starts-with(@class, 'dealitem ')]/@href").each do |node|
     # doc.xpath("//a/span[@class='dealblocktext']/h3/@href").each do |node|
       #puts node.text
       if(Slickdeal.exists?(i+1))
          user=Slickdeal.find(i+1)
          if node.text !="#"
            user.link="http://slickdeals.com" + node.text
            user.save
            i=i+1
          else
            listExpired << p
            p=p+1
            listExpired << p
          end
       else
         if node.text !="#"
           user=Slickdeal.new(:link =>"http://slickdeals.com" + node.text)
           user.save
           i=i+1
         else
           listExpired << p
           p=p+1
           listExpired << p
         end
       end
     p=p+1
     end

     p=0
     i=0
     doc.xpath("//span[@class='dealblocktext']/h3").each do |node|
     #puts node.text
     if(!listExpired.include?(p))
        if(Slickdeal.exists?(i+1))
           user=Slickdeal.find(i+1)
         
           user.name=node.text
           user.name = user.name.gsub(/\n/, ' ')
           user.name = user.name.gsub(/\s\s*/, ' ')
           user.save
           i=i+1
        else
           user=Slickdeal.new(:name =>node.text)
           user.save
           i=i+1
        end
     end
     p=p+1 
    end
   end
end
