require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open("./fixtures/student-site/index.html"))
    doc.css(".student-name").collect do |item|
      student_name = item.name
    end
    binding.pry
  end


  def self.scrape_profile_page(profile_url)

  end

end
