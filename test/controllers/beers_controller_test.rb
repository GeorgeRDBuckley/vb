require 'test_helper'

class BeersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @beer = beers(:one)
  end

  test "should get index" do
    get beers_url
    assert_response :success
  end

  test "should get new" do
    get new_beer_url
    assert_response :success
  end

  test "should create beer" do
    assert_difference('Beer.count') do
      post beers_url, params: { beer: { abv: @beer.abv, alcohol_free: @beer.alcohol_free, beer_image: @beer.beer_image, bootle_conditioned: @beer.bootle_conditioned, can_conditioned: @beer.can_conditioned, description: @beer.description, filtered: @beer.filtered, gluten_free: @beer.gluten_free, is_vegan: @beer.is_vegan, is_vegetarian: @beer.is_vegetarian, name: @beer.name, organic: @beer.organic, serving_temp: @beer.serving_temp, style: @beer.style } }
    end

    assert_redirected_to beer_url(Beer.last)
  end

  test "should show beer" do
    get beer_url(@beer)
    assert_response :success
  end

  test "should get edit" do
    get edit_beer_url(@beer)
    assert_response :success
  end

  test "should update beer" do
    patch beer_url(@beer), params: { beer: { abv: @beer.abv, alcohol_free: @beer.alcohol_free, beer_image: @beer.beer_image, bootle_conditioned: @beer.bootle_conditioned, can_conditioned: @beer.can_conditioned, description: @beer.description, filtered: @beer.filtered, gluten_free: @beer.gluten_free, is_vegan: @beer.is_vegan, is_vegetarian: @beer.is_vegetarian, name: @beer.name, organic: @beer.organic, serving_temp: @beer.serving_temp, style: @beer.style } }
    assert_redirected_to beer_url(@beer)
  end

  test "should destroy beer" do
    assert_difference('Beer.count', -1) do
      delete beer_url(@beer)
    end

    assert_redirected_to beers_url
  end
end
