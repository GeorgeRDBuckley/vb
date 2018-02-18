json.extract! beer, :id, :name, :style, :abv, :description, :beer_image, :is_vegan, :is_vegetarian, :filtered, :bootle_conditioned, :can_conditioned, :organic, :gluten_free, :alcohol_free, :serving_temp, :created_at, :updated_at
json.url beer_url(beer, format: :json)
