class CreateBreweries < ActiveRecord::Migration[5.1]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :county
      t.string :postcode
      t.string :country
      t.string :email
      t.string :telephone
      t.string :website
      t.text :description
      t.attachment :brewery_logo
      t.string :slug
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
