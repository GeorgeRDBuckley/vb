module ApplicationHelper
    def vegan_border_colour(beer)
        if beer.is_vegan
            "border-bottom: 2px solid #28a745;"
        else
            if beer.is_vegetarian
                "border-bottom: 2px solid #f39c12;"
            else
                "border-bottom: 2px solid #c0392b;"
            end
        end
    end

    def brewery_colour_border(brewery)
        if brewery.beers.count === 0
            "border: none; border-bottom: 3px solid grey"
        else
        total_beers = brewery.beers
        vegan_beers = (total_beers.where(is_vegan: true).count.to_f / total_beers.count.to_f * 100).to_i
        veggie_beers = (total_beers.where(is_vegan: false, is_vegetarian: true).count.to_f / total_beers.count.to_f * 100).to_i
        not_vegan_beers = (total_beers.count - vegan_beers - veggie_beers).to_i

        vegan_beers_percentage = vegan_beers
        veggie_beers_percentage = vegan_beers_percentage + veggie_beers
        not_vegan_beers_percentage = veggie_beers_percentage + not_vegan_beers

        "border: none; border-bottom: 3px solid; border-image: linear-gradient(to right, #27ae60 0%, #27ae60 #{vegan_beers_percentage}%, #f39c12 #{vegan_beers_percentage}%, #f39c12 #{veggie_beers_percentage}%, #c0392b #{veggie_beers_percentage}%, #c0392b #{not_vegan_beers_percentage}%) 5;"
        end
    end

    def percentage_vegan(brewery)
        if brewery.beers.count === 0
            "0%"
        else
        beers = brewery.beers
        percentage = beers.where(is_vegan: true).count / beers.count.to_f * 100
        "#{percentage.to_i}%"
        end
    end

    def title(page_title)
        content_for(:title) { page_title }
    end

    def bg_colour(beer)
        if beer.is_vegan
            "vegan_bg"
        else
            if beer.is_vegetarian
                "veggie_bg"
            else
                "not_vegan_bg"
            end
        end
    end
    
end
