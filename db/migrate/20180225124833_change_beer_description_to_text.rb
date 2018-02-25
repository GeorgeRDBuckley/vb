class ChangeBeerDescriptionToText < ActiveRecord::Migration[5.1]
  def change
    change_column :beers, :description, :text
 end
end
