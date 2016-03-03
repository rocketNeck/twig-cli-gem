class Twig::Importer

  def self.import
  self.scrape_dice.each {|post| Post.create(post.title, post.discription, post.location, post.company)}
  end


  def self.scrape_dice
    dice_job_scrape = Nokogiri::HTML(open("https://www.dice.com/jobs?q=ruby&l"))

    job_array = []

    dice_job_scrape.css("").each 10.times do |post|
      array_element = {
        :title => post.css("").text,
        :discription => post.css("").text,
        :location => post.css("div.serp-result-content ul.list-inline.details li.location").text,  #<-----------
        :post_time => post.css("div.serp-result-content ul.list-inline.details li.posted").text,  #<-----------
        :company => post.css("").text,
        :time => post.css("").text
      }
      job_array << array_element
    end
    job_array
  end




end
