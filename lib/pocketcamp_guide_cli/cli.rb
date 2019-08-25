class PocketcampGuideCli::CLI 

	def call
		animal_hash = PocketcampGuideCli::Scraper.new.make_animal_hashes
		PocketcampGuideCli::Animals.create_from_array(animal_hash)
		puts "There is currently #{PocketcampGuideCli::Animals.all.count} registered animals in the PocketCamp game!"
		first_choices
	end

	def first_choices
	  puts "What would you like to do?"
	  puts ""
		puts "Tp search by animal name type name"
		puts "To search by resource type resource"
		puts "To exit type exit"
		puts ""
		
		input = gets.strip
		if input == "name" 
		  search_animal
		elsif input == "resource" 
		  search_resources
		  elsif input == "exit"
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
	  puts "---|#{animal.name}'s|-----------"
	  puts ""
	  puts "   species is: #{animal.species}"
	  puts "   It's theme and essence: #{animal.theme}"
	  puts "   This animal will give you: #{animal.resource}"
	  puts ""
	  puts "                ^   ^    "
	  puts "-------------- (=^·^=) --"
	  puts ""
	end
  
  def multiple_result(array)
    array.each do |item|
      display_animals(item)
    end
  end
  
  def search_resources
    PocketcampGuideCli::Animals.get_all_resources
    input = gets.strip.to_s
    array_result = PocketcampGuideCli::Animals.find_by_resource(input)
    if array_result.empty? == false
      multiple_result(array_result)
      puts "#{array_result.count} result(s)."
    else
      puts "This is not a valid resource."
    end
  end
  
end