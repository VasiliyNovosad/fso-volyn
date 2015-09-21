class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.string :description
      t.references :race, index: true
      t.timestamps
    end
  end
end
