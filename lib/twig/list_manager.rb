require "pry"
class Twig::ListManager #i'm a machine that gathers builds and saves lists of job posts
  attr_accessor :saved_posts, :new_posts

  def initialize
    @saved_posts = []
    @new_posts = []
  end

  def saved_posts
    @saved_posts
  end

  def reset!
    self.new_posts = []
  end

  def create_posts(city = " ")
    reset!
    posts = Twig::Importer.scrape(city)
    posts.each do |post|
    i = Twig::Post.new(post)
    new_posts.push(i)
    end
  end

  def save_a_post(post)
    add_to_saved = self.new_posts[post.to_i - 1]
    self.saved_posts << add_to_saved unless self.saved_posts.include?(self.new_posts[post.to_i - 1])
  end

  def delete_saved_post(delete)
    self.saved_posts.delete_at(delete.to_i - 1)
  end

  def format_list(post, i)
    puts "                               "
    puts "- - - - - - - - - - - - - - - -"
    puts "#{i + 1}. #{post.title.upcase}"
    puts "  #{post.description}"
    puts "                               "
    puts "|Location:  #{post.location} |Company: #{post.company}"
  end

  def list_posts(new_or_saved)
    case new_or_saved
    when "new"
      new_posts.each_with_index do |post, i|
        self.format_list(post, i)
      end
    when "saved"
      if saved_posts != []
        saved_posts.each_with_index do |post, i|
          self.format_list(post, i)
        end
      else
        puts "You have no saved job listings."
      end
    end
  end
end
