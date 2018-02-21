class BreweryAdminController < ApplicationController
    before_action :authenticate_brewery!, except: [:clear]

    def index
    end

    def edit
        @beer = Beer.find_by(brewery_id: @brewery_token.id, slug: params[:beer])
        @beer.brewery_confirmed = true
        @beer.brewery_confirmed_at = Date.today
    end

    def clear
        reset_session
        redirect_to root_path
    end
end
