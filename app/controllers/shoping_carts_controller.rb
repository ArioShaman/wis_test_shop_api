class ShopingCartsController < ApplicationController

    def increment
        # Можно было бы получать обьект корзины напрямую, но для какой-то видимости 
        # аутенфикации делается проверка на существование user и у него уже получаем обьект
        set_shoping_cart_for_action do |shoping_cart_el|
            @shoping_cart_el = shoping_cart_el
            @shoping_cart_el.increment!(:count)
            head :ok
        end
    end

    def decrement
        set_shoping_cart_for_action do |shoping_cart_el|
            @shoping_cart_el = shoping_cart_el
            if @shoping_cart_el.count != 1
                @shoping_cart_el.decrement!(:count)
                head :ok
            else
                render json: {
                    msg: "Count can't be less than 1 ",
                    error: true
                }
            end
        end        
    end

    def add_to_shoping_cart
        set_phone_for_shoping_cart do |phone|
            @phone = phone
            @shoping_cart_el = ShopingCart.create(phone: @phone, guest_user: @guest_user, count: params[:count])
            render json: @shoping_cart_el, 
                        include: "*.*", 
                        adapter: :json,
                        status: 200
        end
    end

    def remove_from_shoping_cart
        set_shoping_cart do |shoping_cart_el|
            @shoping_cart_el = shoping_cart_el
            @shoping_cart_el.destroy
            render json: @shoping_cart_el, 
                include: "*.*", 
                adapter: :json,
                status: 200
        end
    end

    
    private 

    def set_shoping_cart
        @guest_user = GuestUser.find_by!(token: params[:guest_user_id])
        @phone = Phone.find(params[:phone_id])
        @shoping_cart_el = ShopingCart.find_by!(guest_user: @guest_user, phone: @phone)
        yield(@shoping_cart_el)   
    
    end

    def set_phone_for_shoping_cart
        @guest_user = GuestUser.find_by!(token: params[:guest_user_id])
        @phone = Phone.find(params[:phone_id])
        yield(@phone)
    end

    def set_shoping_cart_for_action
        @guest_user = GuestUser.find_by!(token: params[:guest_user_id])
        @shoping_cart_el = ShopingCart.find(params[:shoping_cart_id])
        yield(@shoping_cart_el)

    end
end


