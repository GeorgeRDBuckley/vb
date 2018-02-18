json.extract! brewery, :id, :name, :address1, :address2, :city, :county, :postcode, :country, :email, :telephone, :website, :description, :brewery_logo, :slug, :latitude, :longitude, :created_at, :updated_at
json.url brewery_url(brewery, format: :json)
