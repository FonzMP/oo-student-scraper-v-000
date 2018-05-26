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

    #create hash and push to array for return
    counter = 0
    while counter < holder.length
      students << {:name => holder[counter], :location => holder_two[counter], :profile_url => holder_three[counter]}
      counter += 1
    end

    students

  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open("#{profile_url}"))

    profile_quote = doc.css(".profile-quote").text
    bio = doc.css("div.description-holder p").text

    links_holder = []

    links = doc.css(".social-icon-container a")
    links.each do |link|
      links_holder << link['href']
    end

    twitter = ""

    links_holder.select {|item| twitter = item.include?("twitter")}

    binding.pry

    student_hash = {:twitter => twitter, :linkedin => linkedin, :github => github, :blog => blog, :profile_quote => profile_quote, :bio => bio}
    clean_hash = student_hash.delete_if {|k, v| v == nil}
    clean_hash
  end

end
