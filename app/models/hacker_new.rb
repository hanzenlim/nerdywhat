class HackerNew < ActiveRecord::Base
  
  def self.generateHackerNews

     i=0
     doc = Nokogiri::HTML(open("http://news.ycombinator.com"))
     doc.xpath("//td[@class='title']/a/@href").each do |node|
       #puts node.text
       if(HackerNew.exists?(i+1))
          user=HackerNew.find(i+1)
          if(node.text.size < 255 && node.text =~ /http:/)
            user.link=node.text
            user.save
          end
       else
          user=HackerNew.new(:link =>node.text)
          user.save
       end

       i=i+1
     end

     i=0
     doc.xpath("//td[@class='title']/a").each do |node| 
     #puts node.text
     if(HackerNew.exists?(i+1))
       user=HackerNew.find(i+1)
       user.name=node.text
       user.save
     else
       user=HackerNew.new(:name =>node.text)
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
