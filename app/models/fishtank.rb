class Fishtank < ActiveRecord::Base 
  belongs_to :user 
  has_many :fishes
  
  validates :name, presence: {message: "Name can't be blank."}
  validates :gallons, presence: {message: "Name can't be blank."}
  
  
  
  # def count_by_species(species) # this method would allow you to add multiples of the same fish to a fishtank 
  #   count = 0 
  #   fish.each do |f|
  #     if species == f.species 
  #       count+= 1 
  #     end 
  #   end
  #   count
  # end 
  
end 