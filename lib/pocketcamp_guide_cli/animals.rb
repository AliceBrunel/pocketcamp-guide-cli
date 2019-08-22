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
  
  def self.find_by_name(input)
    @@all.find {|animal| animal.name == input}
  end
  
  def self.find_by_theme(input)
    @@all.select {|animal| animal.theme.include?(input) == true}
  end

  
	def self.count 
		@@all.count
	end

end