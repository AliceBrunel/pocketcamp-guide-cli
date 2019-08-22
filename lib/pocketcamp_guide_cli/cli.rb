class PocketcampGuideCli::CLI 

	def call
		animal_hash = PocketcampGuideCli::Scraper.new.make_animal_hashes
		PocketcampGuideCli::Animals.create_from_array(animal_hash)
		puts "There is currently #{PocketcampGuideCli::Animals.all.count} registered animals in the PocketCamp game."
		first_choices
	end

	def first_choices
		puts "[1] Search by animal name"
		puts "[2] Search by theme"
		puts "[3] Search by resources"
		puts "[4] To exit"
		
		input = gets.strip.to_i
		if input == 1 
		  search_animal
		elsif input == 2 
		  search_theme
		elsif input == 3
		  search_resources
		  elsif input == 4
		  puts "See you soon!"
		else 
		  puts "This input is not valid"
		  first_choices
		end
	end

  def search_animal
    puts "Type a name"
    input = gets.strip.to_s
    result = PocketcampGuideCli::Animals.find_by_name(input)
    if result != nil
      display_animals(result)
      search_animal
    else 
      puts "Doesn't ring a bell... Try something else?"
      first_choices
    end
  end

	def display_animals(animal)
	  puts ""
	  puts "--|#{animal.name}|-----------"
	  puts "   Species: #{animal.species}"
	  puts "   Theme: #{animal.theme}"
	  puts "   Resource: #{animal.resource}"
	  puts "                   ^   ^    "
	  puts "----------------- (=^·^=) --"
	  puts ""
	end
  
  def multiple_result(array,animal)
    array.each do |item|
      display_animals(animal)
    end
  end
  
  def search_theme 
    
  end
  
  def search_resources
    
  end
  
end