class RenameIsOverruledInAdvisements < ActiveRecord::Migration[5.1]
  def change
  	rename_column :advisements, :is_overruled?, :is_overruled
  end
end
