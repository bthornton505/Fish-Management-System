class Fishtanks < ActiveRecord::Base 
  belongs_to :user 
  has_many :fish 
  
end 