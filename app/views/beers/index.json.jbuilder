json.array! @beers do |beer|
    json.name beer.name
    json.style beer.style
    json.isVegan beer.is_vegan
    json.isVegetarian beer.is_vegetarian
    json.breweryConfirmed beer.brewery_confirmed
    json.abv beer.abv
    json.images beer.beer_image
    json.beerSlug beer.slug
    json.likes beer.likers.count
    json.brewery beer.brewery.name
    json.brewerySlug beer.brewery.slug
    json.(beer, :created_at, :updated_at)
end