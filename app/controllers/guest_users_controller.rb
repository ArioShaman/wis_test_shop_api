class GuestUsersController < ApplicationController
    def show
        @guest_user = GuestUser.find_or_create_by(token: params[:id])
        render json: @guest_user, status: 200, include: "*.*", adapter: :json
    end
end
