class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.string :title
      t.string :description
      t.datetime :begin_date
      t.datetime :end_date
      t.references :user
      t.string :bulletin
      t.timestamps
    end
  end
end
