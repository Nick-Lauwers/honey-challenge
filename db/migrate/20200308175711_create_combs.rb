class CreateCombs < ActiveRecord::Migration[5.1]
  def change
    create_table :combs do |t|
      t.decimal :pollen_glob_target

      t.timestamps
    end
  end
end
