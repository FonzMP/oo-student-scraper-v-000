require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open("./fixtures/student-site/index.html"))
    holder = []
    holder_two = []
    holder_three = []
    students = []
    doc.css(".student-name").collect do |item|
      holder << item.text
    end

    doc.css(".student-location").collect do |item|
      holder_two << item.text
    end

    doc.css("div.student-card a").collect do |item|
      holder_three << item['href']
    end
    binding.pry

  end


  def self.scrape_profile_page(profile_url)

  end

end
