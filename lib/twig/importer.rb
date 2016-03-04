require 'open-uri'
require 'pry'
class Twig::Importer
  def self.scrape(city)
    if city == " "
      job_scrape = Nokogiri::HTML(open("https://www.ziprecruiter.com/candidate/search?search=Ruby"))
    elsif city != " "
      city = "https://www.ziprecruiter.com/candidate/search?search=Ruby&location=#{city}"
      binding.pry
      job_scrape = Nokogiri::HTML(open(city.to_s))
    end

    job_array = []

    job_scrape.css("div#job_list article.job_result").each do |post|
      array_element = {
        :title => post.css("div.job_content h2 a span.just_job_title").text,
        :description => post.css("div.job_content p.job_snippet a").text,
        :location => post.css("div.job_content p.job_org a.t_location_link span span span").text,
        :company => post.css("div.job_content p.job_org span span.name a.t_org_link").text
      }
        #:url => post.css("div.job_content h2 a").attribute("href").value
        #moved away from bringing up details. It works however I can't scrape dice.com
        #using the site i am drilling to the details links to other sites and thus can't be parsed
      job_array << array_element
    end
    job_array
  end
end
