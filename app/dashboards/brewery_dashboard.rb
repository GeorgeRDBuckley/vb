require "administrate/base_dashboard"

class BreweryDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    beers: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    address1: Field::String,
    address2: Field::String,
    city: Field::String,
    county: Field::String,
    postcode: Field::String,
    country: Field::String,
    email: Field::String,
    telephone: Field::String,
    website: Field::String,
    description: Field::Text,
    brewery_logo: Field::Carrierwave.with_options(
    image: :standard,
    multiple: false,
    image_on_index: true,
    remove: false,
    remote_url: false
  ),
    brewery_logo_file_name: Field::String,
    brewery_logo_content_type: Field::String,
    brewery_logo_file_size: Field::Number,
    brewery_logo_updated_at: Field::DateTime,
    slug: Field::String,
    latitude: Field::Number.with_options(decimals: 2),
    longitude: Field::Number.with_options(decimals: 2),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    facebook: Field::String,
    instagram: Field::String,
    twitter: Field::String,
    token: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :beers,
    :city,
    :country,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :beers,
    :id,
    :name,
    :address1,
    :address2,
    :city,
    :county,
    :postcode,
    :country,
    :email,
    :telephone,
    :website,
    :description,
    :brewery_logo,
    :brewery_logo_file_name,
    :brewery_logo_content_type,
    :brewery_logo_file_size,
    :brewery_logo_updated_at,
    :slug,
    :latitude,
    :longitude,
    :created_at,
    :updated_at,
    :facebook,
    :instagram,
    :twitter,
    :token,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :beers,
    :name,
    :address1,
    :address2,
    :city,
    :county,
    :postcode,
    :country,
    :email,
    :telephone,
    :website,
    :description,
    :brewery_logo,
    :brewery_logo_file_name,
    :brewery_logo_content_type,
    :brewery_logo_file_size,
    :brewery_logo_updated_at,
    :slug,
    :latitude,
    :longitude,
    :facebook,
    :instagram,
    :twitter,
    :token,
  ].freeze

  # Overwrite this method to customize how breweries are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(brewery)
    brewery.name
  end
end
