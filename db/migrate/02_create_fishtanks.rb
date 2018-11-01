class CreateFishtanks < ActiveRecord::Migration[4.2]
  
  def change 
    create_table :fishtanks do |t|
      t.string :name 
      t.integer :fish_capacity
      t.integer :user_id 
    end 
  end 
  
end 