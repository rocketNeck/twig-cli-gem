#cli controller

class Twig::CLI
  attr_accessor :list_manager

  def call
    puts "---------------------------------------------------------------------"
    puts "|                 Welcome to TWIG!   Job Posts for Rubists          |"
    puts "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww"
    self.list_manager = Twig::ListManager.new   #1 start process adn
    self.list_manager.create_posts
    self.list_manager.list_posts("new")
    menu
  end

  def choices
    puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^&^"
    puts "|                Please type an option.                             |"
    puts "| save a post |  find by city    |   see saved    |    exit         |"
    puts "|   delete a saved post   |  get new job posts  |      help         |"
    puts "---------------------------------------------------------------------"
  end

  def menu
    self.choices
    input = true
    while input
      input = gets.strip

      case input
      when "save a post"
        puts "Select a post to save by number."
        post = gets.chomp
        self.list_manager.save_a_post(post)
        choices
      when "find by city"
        puts "Input a city where you want to search for jobs."
        c = gets.strip
        self.list_manager.create_posts(c)
        self.list_manager.list_posts("new")
        choices
      when "see saved"
        self.list_manager.list_posts("saved")
        choices
      when "delete a saved post"
        self.list_manager.list_posts("saved")
        puts "Select a post to delete. It's perminent."
        delete = gets.chomp
        self.list_manager.delete_saved_post(delete)
        choices
      when "get new job posts"
        self.list_manager.create_posts
        self.list_manager.list_posts("new")
        choices
      when "help"
        self.help
      when "exit"
        puts "thanks!!!!!!!"
        input = false
      else
        puts "Not a valid choice."
      end
    end
  end

  def help
    puts <<-HELP
            save a post - Choose a job post and add it to a saved list.
            find by zip - Use a zip to find jobs near that location.
            see saved - View your saved list
            delete  a saved post - Remove a list item from your saved list.
            get new job posts - Refresh, for most recent job listings.
            exit - exit program
            HELP
  end
  def goodbye
    puts "Thank you for using."
  end
end
