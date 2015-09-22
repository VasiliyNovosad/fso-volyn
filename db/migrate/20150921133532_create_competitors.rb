class CreateCompetitors < ActiveRecord::Migration
  def change
    create_table :competitors do |t|
      t.string :surname
      t.string :name
      t.datetime :birthday
      t.string :qualification
      t.string :trainer
      t.references :category, index: true
      t.references :race, index: true
      t.timestamps
    end
  end
end
