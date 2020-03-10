class AddWorkerBeeAndCombToAdvisements < ActiveRecord::Migration[5.1]
  def change
    add_reference :advisements, :worker_bee, foreign_key: true
    add_reference :advisements, :comb, foreign_key: true
  end
end
