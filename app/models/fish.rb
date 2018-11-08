class Fish < ActiveRecord::Base 
  belongs_to :fishtank
  
  validates :species, presence: {message: "Species can't be blank."}
  
end 