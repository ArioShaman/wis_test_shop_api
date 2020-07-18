class GuestUsersController < ApplicationController
    def show
        @guest_user = GuestUser.where(token: params[:id]).first
        if @guest_user.present?
            return @guest_user
        else
            @guest_user = GuestUser.create(token: params[:id])
            return @guest_user
        end
    end
end
