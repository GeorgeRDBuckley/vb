class Beer < ApplicationRecord
    has_many :beer_likes
    has_many :likers, foreign_key: "beer_id", class_name: "BeerLike", dependent: :destroy
    has_many :users, through: :beer_likes, dependent: :destroy
    before_save :update_beer_slug

    has_attached_file :beer_image, styles: {:thumb => "200x200", small: "64x64", med: "300x300", large: "400x400" }, :convert_options => {
        :thumb => "-resize 90%x90% -gravity center -background white -extent 200x200", :large => "-resize 90%x90% -gravity center -background white -extent 400x400" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :beer_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    belongs_to :brewery

    searchkick

    def search_data
        attributes.merge(
          brewery_name_from_relation: self.brewery_name_from_relation
        )
      end
      
      def brewery_name_from_relation
        self.brewery.name
      end

    def update_beer_slug
        self.slug = "#{name.parameterize}"
    end

end
