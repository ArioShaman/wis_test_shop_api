class WishListsController < ApplicationController

    def add_to_wish_list
        set_wish_list do |phone|
            @phone = phone
            @wish_list_el = WishList.create(phone: @phone, guest_user: @guest_user)
            render json: @wish_list_el, 
                   include: "*.*", 
                   adapter: :json,
                   status: 200
        end
    end

    def remove_from_wish_list
        set_wish_list do |phone|
            @phone = phone
            @wish_list_el = WishList.find_by!(phone_id: @phone.id, guest_user_id: @guest_user.id)
            @wish_list_el.destroy
            render json: @wish_list_el, 
                    include: "*.*", 
                    adapter: :json,
                    status: 200
        end
    end
    
    private

    def set_wish_list
        @guest_user = GuestUser.find_by!(token: params[:guest_user_id])
        @phone = Phone.find(params[:phone_id])
        yield(@phone)
    end
end
