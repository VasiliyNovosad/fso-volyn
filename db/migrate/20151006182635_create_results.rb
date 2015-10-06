class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :start_number
      t.datetime :start_at
      t.datetime :finish_at
      t.string :state
      t.references :competitor, index: true
      t.references :race, index: true
      t.timestamps null: false
    end
  end
end
