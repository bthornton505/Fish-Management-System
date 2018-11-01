class CreateFishtanks < ActiveRecord::Migration[4.2]
  
  def change 
    create_table :fishtanks do |t|
      t.integer :gallons
      t.integer :fish_capacity
      t.integer :user_id 
      # t.integer :fish_id
    end 
  end 
  
end 