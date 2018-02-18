module BeersHelper
    def liked
        current_user.likes.where(beer_id: @beer.id).exists?
    end
end
