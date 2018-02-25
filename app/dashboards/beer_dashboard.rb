require "administrate/base_dashboard"

class BeerDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    likers: Field::HasMany.with_options(class_name: "BeerLike"),
    brewery: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    style: Field::String,
    abv: Field::String,
    description: Field::Text,
    beer_image: Field::Carrierwave.with_options(
    image: :standard,
    multiple: false,
    image_on_index: true,
    remove: false,
    remote_url: false
  ),
    beer_image_file_name: Field::String,
    beer_image_content_type: Field::String,
    beer_image_file_size: Field::Number,
    beer_image_updated_at: Field::DateTime,
    is_vegan: Field::Boolean,
    is_vegetarian: Field::Boolean,
    filtered: Field::Boolean,
    bootle_conditioned: Field::Boolean,
    can_conditioned: Field::Boolean,
    organic: Field::Boolean,
    gluten_free: Field::Boolean,
    alcohol_free: Field::Boolean,
    serving_temp: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    slug: Field::String,
    brewery_confirmed: Field::Boolean,
    brewery_confirmed_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :brewery,
    :likers,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :likers,
    :brewery,
    :id,
    :name,
    :style,
    :abv,
    :description,
    :beer_image,
    :is_vegan,
    :is_vegetarian,
    :filtered,
    :bootle_conditioned,
    :can_conditioned,
    :organic,
    :gluten_free,
    :alcohol_free,
    :serving_temp,
    :created_at,
    :updated_at,
    :slug,
    :brewery_confirmed,
    :brewery_confirmed_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :brewery,
    :name,
    :style,
    :abv,
    :description,
    :beer_image,
    :is_vegan,
    :is_vegetarian,
    :filtered,
    :bootle_conditioned,
    :can_conditioned,
    :organic,
    :gluten_free,
    :alcohol_free,
    :serving_temp,
    :slug,
    :brewery_confirmed,
    :brewery_confirmed_at,
  ].freeze

  # Overwrite this method to customize how beers are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(beer)
     beer.name
  end
end
