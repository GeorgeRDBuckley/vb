class AddBreweryConfirmedToBeer < ActiveRecord::Migration[5.1]
  def change
    add_column :beers, :brewery_confirmed, :boolean, default: false
    add_column :beers, :brewery_confirmed_at, :timestamp, default: nil
  end
end
