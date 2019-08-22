class PocketcampGuideCli::CLI 

	def call
		animal_hash = PocketcampGuideCli::Scraper.new.make_animal_hashes
		PocketcampGuideCli::Animals.create_from_array(animal_hash)
		puts "There is currently #{PocketcampGuideCli::Animals.all.count} registered animals in the PocketCamp game."
		first_choices
	end

	def first_choices
	  puts "What would you like to do?"
		puts "[1] Search by animal name"
		puts "[2] Search by theme"
		puts "[3] Search by resource"
		puts "[4] To exit"
		
		input = gets.strip.to_i
		if input == 1 
		  search_animal
		elsif input == 2 
		  search_theme
		  first_choices
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
  
  def search_theme 
    puts "Type a following:"
    puts "cool essence   -   natural essence   -  modern essence"
    puts "harmonious essence   -   hip essence   -   sporty essence"
    puts "cute essence   -   civic essence   -   rustic essence"
    puts "elegant essence   -   historical essence"
    input = gets.strip.to_s
    array_result = PocketcampGuideCli::Animals.find_by_theme(input)
    if array_result == input
      multiple_result(array_result)
      puts "#{array_result.count} result(s)."
    else
      "This is not a valid resource."
    end
  end
  
  def search_resources
    
  end
  
end