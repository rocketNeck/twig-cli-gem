#cli controller

class Twig::CLI

  def call
    puts "Welcome to TWIG"
    list_new_posts   #1 start process adn
    menu  #bring up short menu of choices and opperate on the list
  end

  def list_new_posts #fires of a request to List::Manager to get job listing
  #  list =  Twig::ListManager.recent_list
  #  list.each_with_index(1) do |val, i|
    #  puts "#{i}) #{val.description} \n#{val.location}\n#{val.url}"
  #  end
  end


  #loop where the cli is functiioning
  def menu
    puts "Please type an option."
    puts "| save a post | find by zip | see saved | exit |"

    input = gets.strip
    while input.downcase != "exit"
      if input == "save a post"
        puts "Select a post to save."
        post = gets.strip
      #  save_post(post)#<---------------choose a job and save it
      elsif input == "find nearest"
        puts "Input a zip code for where you want to search around."
        zip = gets.strip
    #    get_jobs_near(zip)#<-------------- use zip to get postings nearest the zip
      elsif input == "exit"
        puts "Okay, check again soon."
      end
    end
  end

  def look_up_saved_locations

  end

  def look_up_new_locations
  end

  def goodbye
    puts "Thank you for using."
  end
end
