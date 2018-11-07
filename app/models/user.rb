class User < ActiveRecord::Base 
  has_many :fishtanks
  has_secure_password 
  
  validates :username, uniqueness: {case_sensitive: false, message: "That username is taken."}, presence: {message: "Username can't be blank."}
  validates :email, uniqueness: {case_sensitive: false, message: "There is already an account with that email. Try logging in."}, presence: {message: "Email can't be blank."}

  def slug
    username.downcase.gsub(" ","-")
  end 
  
  def self.find_by_slug(slug)
    User.all.find {|user| user.slug == slug}
  end
  
end 