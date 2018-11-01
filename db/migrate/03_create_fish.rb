class CreateFish < ActiveRecord::Migration[4.2]
  
  def change 
    create_table :fish do |t|
      t.string :species
      t.integer :fishtank_id
    end 
  end 
  
end 