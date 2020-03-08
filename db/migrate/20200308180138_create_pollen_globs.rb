class CreatePollenGlobs < ActiveRecord::Migration[5.1]
  def change
    create_table :pollen_globs do |t|
      t.decimal :quantity
      t.references :comb, foreign_key: true
      t.references :worker_bee, foreign_key: true

      t.timestamps
    end
  end
end
