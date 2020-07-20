class WishListsController < ApplicationController

    def add_to_wish_list
        set_wish_list do |phone|
            @phone = phone
            @wish_list_el = WishList.create(phone: @phone, guest_user: @guest_user)
            return @wish_list_el
        end
    end

    def remove_from_wish_list
        set_wish_list do |phone|
            @phone = phone
            @wish_list_el = WishList.where(phone_id: @phone.id, guest_user_id: @guest_user.id).first
            if @wish_list_el.present?
                @wish_list_el.destroy
                return @wish_list_el
            else
               render json: {
                    msg: "WishEl not found",
                    error: true
                } 
            end            
        end
    end
    
    private
    def set_wish_list
        @guest_user = GuestUser.where(token: params[:guest_user_id]).first
        if @guest_user.present?
            @phone = Phone.find(params[:phone_id])
            if @phone.present?
                yield(@phone)
            else
                render json: {
                    msg: "Phone not exist",
                    error: true
                }
            end
        else
            render json: {
                msg: "User not found",
                error: true
            }
        end
    end
end
