class PocketcampGuideCli::Animals


	attr_accessor :name, :species, :objects

	@@all = []

	def initialize(name, species, objects)
		@name = name 
		@species = species
		@objects = objects
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
  
  def self.find_by_name(input)
    @@all.find {|animal| animal.name == input}
  end

  
	def self.count 
		@@all.count
	end

end