class GuestUsersController < ApplicationController
    def show
        @guest_user = GuestUser.find_or_create_by(token: params[:id])
        render json: @guest_user, 
            include: "*.*", 
            adapter: :json,
            status: 200
    end
end
