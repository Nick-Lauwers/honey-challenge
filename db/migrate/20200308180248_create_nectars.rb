class CreateNectars < ActiveRecord::Migration[5.1]
  def change
    create_table :nectars do |t|
      t.integer :quantity
      t.references :comb, foreign_key: true
      t.references :worker_bee, foreign_key: true

      t.timestamps
    end
  end
end
