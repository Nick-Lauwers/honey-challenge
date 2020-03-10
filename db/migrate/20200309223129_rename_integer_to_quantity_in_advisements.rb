class RenameIntegerToQuantityInAdvisements < ActiveRecord::Migration[5.1]
  def change
  	rename_column :advisements, :integer, :quantity
  end
end
