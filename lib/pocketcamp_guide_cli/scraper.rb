class PocketcampGuideCli::Scraper
   
  @@animals = []
  @@index_animal_name = 0
  @@index_animal_personality = 1
  @@index_animal_species = 2
  @@index_animal_theme = 4
  @@index_animal_resource = 3
  
  def get_page 
    Nokogiri::HTML(open("https://animalcrossing.fandom.com/wiki/Villager_list_(Pocket_Camp)"))
  end
  def scrape_animal_info
    animal_info = self.get_page.css("table.roundy.sortable tr a[title]") 
    animal_info.each_slice(5).to_a
  end
    
  def make_animal_hashes
    animals_hash = []
    animals = scrape_animal_info
    animals.each do |animal_array|
      name = animal_array[@@index_animal_name].text
      personality = animal_array[@@index_animal_personality].text
      species = animal_array[@@index_animal_species].text
      theme = animal_array[@@index_animal_theme].text
      resource = animal_array[@@index_animal_resource].text
      animals_hash << {:name => name, :species => species, :theme => theme, :resource => resource}
    end
    animals_hash
  end
 
end