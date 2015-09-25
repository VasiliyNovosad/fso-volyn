class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :short_text
      t.text :text
      t.references :user, index: true
      t.timestamps
    end
  end
end
