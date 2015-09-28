class ChangeColumnDescriptionType < ActiveRecord::Migration
  def change
    change_column :categories, :description, :text
    change_column :distances, :description, :text
    change_column :competitions, :description, :text
    change_column :competitions, :bulletin, :text
    change_column :races, :description, :text
  end
end
