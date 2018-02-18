class AddSocialmediaToBrewery < ActiveRecord::Migration[5.1]
  def change
    add_column :breweries, :facebook, :string
    add_column :breweries, :instagram, :string
    add_column :breweries, :twitter, :string
  end
end
