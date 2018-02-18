class PagesController < ApplicationController
  def index
    @breweries = Brewery.order("RANDOM()").limit(7)
    @beers = Beer.order("RANDOM()").limit(11)
    @recent_likes = BeerLike.order("created_at DESC").limit(5)
  end

  def search

    @beers = Beer.search(params[:query], fields: [:name, "brewery_name_from_relation"])
    @breweries = Brewery.search(params[:query], fields: [:name])
    @recent_likes = BeerLike.order("created_at DESC").limit(5)
  end

  def beers_that_use_ingless
    @slug = "beers-that-use-ingless"
  end

  def vegan_stout_beers
  end

  def what_beers_are_not_vegan
  end

  def vegetarian_ales
  end

  def beers_that_are_vegan
  end

  def vegetarian_beers
  end

  def vegan_ales
  end

  def vegan_lager_uk
  end

  def vegan_alcohol_brands
  end

  def what_beers_are_vegan
  end

  def is_lager_vegan
  end

  def is_beer_vegetarian
  end

  def best_vegan_beer
  end

  def vegan_non_alcoholic_beer
  end

  
end
