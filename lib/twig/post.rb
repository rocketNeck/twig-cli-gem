class Twig::Post
  attr_accessor :title, :description, :location, :company, :url
  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end
end
