class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :title
      t.string :description
      t.string :discipline
      t.datetime :begin_date
      t.datetime :end_date
      t.string :place
      t.references :competition, index:true
      t.timestamps
    end
  end
end
