class RenameColumnInFishtanks < ActiveRecord::Migration[4.2]
  
  def change 
    rename_column :fishtanks, :fish_capacity, :gallons
  end 
  
end 