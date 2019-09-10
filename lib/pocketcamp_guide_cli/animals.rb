class PocketcampGuideCli::Animals


	attr_accessor :name, :species, :theme, :resource

	@@all = []

	def initialize(name, species, theme, resource)
		@name = name
		@species = species
		@theme = theme
		@resource = resource
		@@all << self
	end

	def self.all 
		@@all
	end

	def self.create_from_array(animals_array)
		animals_array.each do |animal_hash|
		name = animal_hash[:name]
		personality = animal_hash[:personality]
		species = animal_hash[:species]
		theme = animal_hash[:theme]
		resource = animal_hash[:resource]
		self.new(name, species, theme, resource)
		end
	end
	
	def self.all_animals_names
	@@all.each do |animal|
	    puts animal.name
	  end
	end
	
	def self.find_by(criteria, input)
	  @@all.select {|animal| animal.send(criteria).downcase.include?(input) == true}
	end

  def self.get_all_lists(criteria)
    array = []
    @@all.each do |animal|
      array << animal.send(criteria)
    end
    puts "Type the name of the item you are looking for from the list below:"
    puts "#{array.uniq}"
  end
	
	def self.count 
		@@all.count
	end
	
	def self.find_by_letter(letter)
	  @@all.select {|animal| animal.name.include?(letter)}
	end
  
end