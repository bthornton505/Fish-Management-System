class Fishtank < ActiveRecord::Base 
  belongs_to :user 
  has_many :fish 
  
  def count_by_species(species)
    count = 0 
    fish.each do |f|
      if species == f.species 
        count+= 1 
      end 
    end
    count
  end 
  
end 