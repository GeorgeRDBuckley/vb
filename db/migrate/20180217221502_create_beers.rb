class CreateBeers < ActiveRecord::Migration[5.1]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :style
      t.string :abv
      t.string :description
      t.attachment :beer_image
      t.boolean :is_vegan
      t.boolean :is_vegetarian
      t.boolean :filtered
      t.boolean :bootle_conditioned
      t.boolean :can_conditioned
      t.boolean :organic
      t.boolean :gluten_free
      t.boolean :alcohol_free
      t.string :serving_temp

      t.timestamps
    end
  end
end
