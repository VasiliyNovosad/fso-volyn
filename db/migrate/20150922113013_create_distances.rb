class CreateDistances < ActiveRecord::Migration
  def change
    create_table :distances do |t|
      t.string :title
      t.string :description
      t.integer :distance_length
      t.decimal :cp_count
      t.references :race, index: true
      t.timestamps
    end

    add_reference :categories, :distance, index: true
  end
end
