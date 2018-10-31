class CreateFish < ActiveRecord::Migration
  
  def change 
    create_table :fish do |t|
      t.string :species
      t.integer :quantity
      t.integer :fishtank_id
    end 
  end 
end 