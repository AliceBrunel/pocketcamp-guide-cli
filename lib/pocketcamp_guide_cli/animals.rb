class PocketcampGuideCli::Animals


	attr_accessor :name, :species, :resource

	@@all = []

	def initialize(name, species, resource)
		@name = name
		@species = species
		@resource = resource
		@@all << self
	end

	def self.all 
		@@all
	end

	def self.create_from_array(animals_array)
		animals_array.each do |animal_hash|
		name = animal_hash[:name]
		species = animal_hash[:species]
		resource = animal_hash[:resource]
		self.new(name, species, resource)
		end
	end
  
  def self.find_by_name(input)
    @@all.find {|animal| animal.name == input}
  end

  
	def self.count 
		@@all.count
	end

end