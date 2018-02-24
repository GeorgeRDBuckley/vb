module UsersHelper
    def vegan_likes(user)
        @vegan_count = 0
        user.likes.each do |like|
            @beer = Beer.find_by(id: like.beer_id)
            if @beer.is_vegan
                @vegan_count += 1
            end
        end
        return @vegan_count
    end

    def percentage_vegan_likes(user)
        if user.likes.count === 0
            "N/A"
        else
            percentage = vegan_likes(user).to_f / user.likes.count.to_f * 100
            "#{percentage.to_i}%"
        end
    end
end