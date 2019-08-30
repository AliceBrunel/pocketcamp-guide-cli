class PocketcampGuideCli::CLI 

	def call
		animal_hash = PocketcampGuideCli::Scraper.new.make_animal_hashes
		PocketcampGuideCli::Animals.create_from_array(animal_hash)
		puts "Hi campers! Currently, #{PocketcampGuideCli::Animals.all.count} animals are registered in the PocketCamp game!"
		first_choices
	end

	def first_choices
	  puts "What would you like to do?"
	  puts ""
	  puts "To view the list of animals name type 0"
		puts "To search by animal name type 1"
		puts "To search by resource type 2"
		puts "To search by essence type 3"
		puts "To exit type exit"
		puts ""
		
		input = gets.strip
		if input == "0"
		  print_all_animals
		  first_choices
		elsif input == "1" 
		  search_by("name", false)
		elsif input == "2" 
		  search_by("resource", true)
		elsif input == "3"
		  search_by("theme", true)
		elsif input.downcase == "exit"
		  puts "See you on the campsite!"
		else 
		  puts "This input is not valid"
		  first_choices
		end
	end
  
  def print_all_animals
    PocketcampGuideCli::Animals.all_animals_names
  end

  def search_by(criteria, printall)
    search_criteria = criteria
    if printall == true
    PocketcampGuideCli::Animals.get_all_lists(search_criteria)
    end
    input = gets.strip.to_s.downcase
    array_result = PocketcampGuideCli::Animals.find_by(search_criteria, input)
    display_search_results(array_result)
  end
  
  def display_search_results(array)
    if array.empty? == false
      multiple_result(array)
      puts "#{array.count} result(s)."
    else
      puts "Sorry, can't find this!"
    end
    first_choices
  end

	def display_animals(animal)
	  puts "---|#{animal.name}|-----------"
	  puts ""
	  puts "   species: #{animal.species}"
	  puts "   It's theme and essence: #{animal.theme}"
	  puts "   This animal will give you: #{animal.resource}"
	  puts ""
	  puts "     ^   ^     "
	  puts "--- (=^·^=) ---"
	  puts ""
	end
  
  def multiple_result(array)
    array.each do |item|
      display_animals(item)
    end
  end
end