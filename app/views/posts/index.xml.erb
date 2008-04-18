xml.instruct! :xml, :version=>"1.0"
xml.rss(:version => "2.0") do
  xml.channel do
    xml.title("My Mack Blog")
    xml.link(posts_index_full_url)
    xml.description("Find out about all the cool stuff happening on my blog!")
    xml.language("en-us")
    xml.copyright("Copyright Me")
    xml.pubDate(CGI.rfc1123_date(Time.now))
    xml.lastBuildDate(CGI.rfc1123_date(Time.now))
    @posts.each do |post|
      xml.entry do
        xml.title(post.title)
        xml.link(posts_show_full_url(:id => post.id))
        xml.description(post.body)
        xml.pubDate(post.created_at.strftime("%a, %d %b %Y %H:%M:%S"))
      end
    end
  end
end