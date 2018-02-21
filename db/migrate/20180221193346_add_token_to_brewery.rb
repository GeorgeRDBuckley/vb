class AddTokenToBrewery < ActiveRecord::Migration[5.1]
  def change
    add_column :breweries, :token, :string
  end
end
