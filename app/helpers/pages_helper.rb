module PagesHelper
    def beer_count_rounder
        total = Beer.count + Brewery.count
        if total < 10
            "over #{total - 1}"
        else
            "over #{total.round(-1)}"
        end
    end
end
