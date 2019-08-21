class PocketcampGuideCli::Animals


	attr_accessor :name, :species, :objects

	@@all = []

	def initialize(name, species, objects)
		@name = name 
		@species = species
		@objects = catchphrase
		@@all << self
	end

	def self.all 
		@@all
	end

	def self.create_from_array(animals_array)
		animals_array.each do |animal_hash|
		name = animal_hash[:name]
		species = animal_hash[:species]
		objects = animal_hash[:objects]
		self.new(name, species, objects)
		end
	end
  
  def self.search_animals
    puts "Type a name"
    input = gets.strip
    animal_names = @@all.collect {|animal_object| animal_object.name == input}
    if input == animal_names
      display_animals(animal_names)
    else 
      puts "Doesn't ring a bell..."
      first_choices
    end
  end

  
	def self.count 
		@@all.count
	end

end