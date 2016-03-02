#cli controller

class Twig::CLI

  def call
    puts "Welcome to TWIG"
    list_job_posts
  end
  def list_job_posts
   puts <<-DOC
   1. Ruby Job Doing Cool Stuff city,ST
   2. Ruby Job Doing Cool Stuff sity,ST
   3. Ruby Job Doing Cool Stuff shity,ST
   4. Ruby Job Doing Cool Stuff skit,SA
   5. Ruby Job Doing Cool Stuff sip, SP
   6. Ruby Job Doing Cool Stuff town,PL
   DOC
  end
  def start_menu

  end

end
