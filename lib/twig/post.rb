class Twig::Post
  attr_accessor :title, :description, :location, :company,  :distance , :time
#represents a single post it has attributes
#an individual post has a location / description / url
  @@all = []
  def self.all
    @@all
  end

  def self.save
    @@all << self
  end

  def self.reset
    @@all.clear
  end

  def crate(title, description, location, company, time )
    post = self.new
    post.reset
    post.title = title
    post.description = description
    post.location = location
    post.company = company
    post.time = time
    post.save
    post
  end

  # def self.create(description, location = nil, url = nil)<------------try both of these
  #   self.reset
  #   new(title, description, location, company).tap{|p| p.save}
  # end


end
