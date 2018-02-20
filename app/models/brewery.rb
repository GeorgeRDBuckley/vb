class Brewery < ApplicationRecord
    searchkick
    
    before_save :update_slug
    validates :slug, uniqueness: { case_sensitive: false }

    mount_uploader :brewery_logo, BreweryLogoUploader, mount_on: :brewery_logo_file_name
    has_many :beers, :dependent => :destroy

    geocoded_by :address
    after_validation :geocode, if: :address_changed?

    def address
    [address1, address2, city, county, postcode, country].compact.join(', ')
    end

    def address_changed?
        address1_changed? || address2_changed? || city_changed? || county_changed? || postcode_changed? || country_changed?
    end

    def update_slug
        self.slug = name.parameterize
    end

end
