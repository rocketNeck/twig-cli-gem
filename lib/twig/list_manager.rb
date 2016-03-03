
class Twig::ListManager #i'm a machine that gathers builds and saves lists of job posts
  attr_accessor :saved, :new_posts

  def initialize
    @saved = []
  end


  def saved
    @saved
  end

  def get_recent_list
    #return instances of new posts from twitter


  end
  def list_new_posts
    new_posts = Twig::Importer.import
    self.saved << new_posts
    new_posts.each_with_index(1) do |post, i|
      puts "#{i}. #{post}"
    end
  end
  # def delet_all_saved_posts
  #   #empty out your saved_list of job posts
  #   @saved.clear
  # end
  # def delet_single_saved_post
  #   #after seeing a list of your saved posts you can choose to delete one
  #   @saved.clear
  # end
  # def save_post(post)
  #   #after seeing a list of recent job posts you can save one to your saved list
  #   #checks to see if saved_post_exists?
  #   #if it does alert user if it doesn't save it and alert userd
  #   @saved << post
  # end
  # def saved_post_exists?(post)
  #   #checks to see of a post exists
  #   @saved.include?(post)
  # end
   a_post = [{discription:"Ruby Job Doing Cool Stuff", location: "city,ST", url:"www.stuff.com", distnce: nil},
             {discription:"Ruby things doind stuff", location: "Place,CO", url:"www.otherstuff.com", distnce: "200mi"}]

end
