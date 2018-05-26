require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html_doc = Nokogiri::HTML("./fixtures/student-site/index.html")
      binding.pry
  end


  def self.scrape_profile_page(profile_url)

  end

end
