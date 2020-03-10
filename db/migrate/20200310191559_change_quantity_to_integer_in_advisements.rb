class ChangeQuantityToIntegerInAdvisements < ActiveRecord::Migration[5.1]
  def change
  	change_column :advisements, :quantity, :integer
  end
end
