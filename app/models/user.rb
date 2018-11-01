class User < ActiveRecord::Base 
  has_many :fishtanks
  has_secure_password 
  
end 