class UsersController < ApplicationController
    def show
        @user = User.find_by(username: params[:id].to_s.downcase) or not_found
    end
end
