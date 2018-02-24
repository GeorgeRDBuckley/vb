class Beer < ApplicationRecord
    has_many :likers, foreign_key: "beer_id", class_name: "BeerLike", dependent: :destroy
    before_save :update_beer_slug
    

    mount_uploader :beer_image, BeerImageUploader, mount_on: :beer_image_file_name
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
