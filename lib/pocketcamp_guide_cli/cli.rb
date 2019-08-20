class PocketcampGuideCli::CLI 

	def call
		puts "Welcome to your Pocket Camp characters guide! If you want to know which animals to invite on your camp, you can view an animal card if you know its name, or search by theme, or search by resources."
		first_choices
	end

	def first_choices
	  puts "What would you like to do?"
		puts "[1] Search by name"
		puts "[2] Search by theme and essences"
		puts "[3] Search by resources"
		input = gets.strip.to_i
		if input == 1 
		  search_animal
		elsif input == 2 
		  search_theme
		elsif input == 3
		  search_resources
		else 
		  puts "This input is not valid"
		end
	end

  def search_animal
    puts "Type a name"
    input = gets.strip
    if input == "Agnes"
      display_animals
    else 
      puts "Doesn't ring a bell..."
      first_choices
    end
  end

	def display_animals
	  puts "------------"
	  puts "------------"
	  puts "name: Agnes"
	  puts "------------"
	  puts "species: Pig"
	  puts "Theme: Cool"
	  puts "Resources: coton, cool essence"
	  puts "------------"
	  puts ""
	  first_choices
	end
  
  def search_theme 
    puts "Here is the list of themes and essences. Type the number corresponding to the essence you are looking for and this will print the animals who will give you the essence."
    puts "Essence list"
    input = gets.strip.to_1
    "Agnes"
    "Agnes"
    "Agnes"
    "Agnes"
    "Agnes"
    "Agnes"
    "Agnes"
    first_choices
  end
  
  def search_resources
    puts "Here is the list of resources. Type the number corresponding to the Resources you are looking for and this will print the animals who will give you the resources."
    puts "resources list"
    input = gets.strip.to_1
    "Agnes"
    "Agnes"
    "Agnes"
    "Agnes"
    "Agnes"
    "Agnes"
    "Agnes"
    first_choices
  end
  
end