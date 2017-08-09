class AddcolumnlentToBorrower < ActiveRecord::Migration
  def change
  	add_column :borrowers, :lent, :float 
  end
end
