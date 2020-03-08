class CreateAdvisements < ActiveRecord::Migration[5.1]
  def change
    create_table :advisements do |t|
      t.decimal :integer
      t.boolean :is_overruled?

      t.timestamps
    end
  end
end
