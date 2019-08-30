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
		  search_animal
		elsif input == "2" 
		  search_resources
		elsif input == "3"
		  search_essences
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

  def search_animal
    puts "Type a name or type back to return to the first choices"
    input = gets.strip.to_s.capitalize
    result = PocketcampGuideCli::Animals.find_by_name(input)
    if result != nil && input != "Back"
      display_animals(result)
      search_animal
    elsif input == "Back"
      first_choices
    else
      puts "Doesn't ring a bell... Try something else?"
      first_choices
    end
  end
  
  def search_resources
    PocketcampGuideCli::Animals.get_all_lists("resource")
    input = gets.strip.to_s.downcase
    array_result = PocketcampGuideCli::Animals.find_by_resource(input)
    display_search_results(array_result)
  end
  
  def search_essences
    PocketcampGuideCli::Animals.get_all_lists("theme")
    input = gets.strip.to_s.downcase
    array_result = PocketcampGuideCli::Animals.find_by_essence(input)
    display_search_results(array_result)
  end
  
  def display_search_results(array)
    if array.empty? == false
      multiple_result(array)
      puts "#{array.count} result(s)."
    else
      puts "This element doesn't exist in the game."
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