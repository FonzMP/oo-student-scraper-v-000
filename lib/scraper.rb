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

    # student name
    doc.css(".student-name").collect do |item|
      holder << item.text
    end

    #student location
    doc.css(".student-location").collect do |item|
      holder_two << item.text
    end

    #student URL
    doc.css("div.student-card a").collect do |item|
      holder_three << item['href']
    end

    counter = 0
    while counter < holder.length
      students << {:name => holder[counter], :location => holder_two[counter], :profile_url => holder_three[counter]}
      counter += 1
    end

    students

  end

  def self.scrape_profile_page(profile_url)

  end

end
