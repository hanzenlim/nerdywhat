class RedditProgramming < ActiveRecord::Base
  def self.generateRedditProgramming

     i=0
     doc = Nokogiri::HTML(open("http://www.reddit.com/r/programming/"))
     doc.xpath("//div[@class='entry unvoted']/p[@class='title']/a[@class='title ']/@href").each do |node|
       #puts node.text
       if(RedditProgramming.exists?(i+1))
          user=RedditProgramming.find(i+1)
          if(node.text.size < 255 && node.text =~ /http:/)
            user.link=node.text
          else
            user.link="http://www.reddit.com" + node.text
          end
          user.save
       else
          user=RedditProgramming.new(:link =>node.text)
          user.save
       end

       i=i+1
     end

     i=0
     doc.xpath("//div[@class='entry unvoted']/p[@class='title']/a[@class='title ']").each do |node|
     #puts node.text
     if(RedditProgramming.exists?(i+1))
       user=RedditProgramming.find(i+1)
       user.name=node.text
       user.save
     else
       user=RedditProgramming.new(:name =>node.text)
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
