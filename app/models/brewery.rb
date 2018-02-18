class Brewery < ApplicationRecord
    searchkick
    
    before_save :update_slug
    validates :slug, presence: :true, uniqueness: { case_sensitive: false }

    has_attached_file :brewery_logo, styles: {:thumb => "200x200", small: "64x64", med: "300x300", large: "400x400" }, :convert_options => {
        :thumb => "-resize 70%x70% -gravity center -background white -extent 200x200", :large => "-resize 70%x70% -gravity center -background white -extent 400x400" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :brewery_logo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    has_many :beers

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

    def to_param
        slug
    end
end
