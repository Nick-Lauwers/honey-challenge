class AddDefaultValueToIsOverruled < ActiveRecord::Migration[5.1]
  def change
   	change_column :advisements, :is_overruled?, :boolean, default: false
  end
end
