require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open("./fixtures/student-site/index.html"))
    holder = []
    doc.css(".student-name").collect do |item|
      holder << {:name => item.text}
    end

    doc.css(".student-location").collect do |item|
      holder_two << {:location => item.text}
    end
    binding.pry
  end


  def self.scrape_profile_page(profile_url)

  end

end
