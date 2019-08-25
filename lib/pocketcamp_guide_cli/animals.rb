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
  
  def self.find_by_resource(input)
    @@all.select {|animal| animal.resource.include?(input) == true}
  end

  def self.get_all_resources
    resources_array = []
    @@all.each do |animal|
      resources_array << animal.resource
    end
    puts "Type the resource you are looking for to see the list of animals providing this resource :"
    puts "#{resources_array.uniq}"
  end
	
	def self.count 
		@@all.count
	end

end