class AddIngredientsToBeer < ActiveRecord::Migration[5.1]
  def change
    add_column :beers, :ingredients, :text
  end
end
