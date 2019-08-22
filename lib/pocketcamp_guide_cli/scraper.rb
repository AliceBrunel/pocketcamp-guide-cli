class PocketcampGuideCli::Scraper
   
  @animals = []
  
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
      name = animal_array[0].text
      personality = animal_array[1].text
      species = animal_array[2].text
      theme = animal_array[4].text
      resource = animal_array[3].text
      animals_hash << {:name => name, :species => species, :theme => theme, :resource => resource}
    end
    animals_hash
  end
 
end