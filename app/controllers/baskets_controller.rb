    class BasketsController < ApplicationController

    def increment
        # Можно было бы получать обьект корзины напрямую, но для какой-то видимости 
        # аутенфикации делается проверка на существование user и у него уже получаем обьект
        set_basket_for_action do |basket_el|
            @basket_el = basket_el
            @basket_el.increment!(:count)
            head :ok
        end
    end

    def decrement
        set_basket_for_action do |basket_el|
            @basket_el = basket_el
            if @basket_el.count != 1
                @basket_el.decrement!(:count)
                head :ok
            else
                render json: {
                    msg: "Count can't be less than 1 ",
                    error: true
                }
            end
        end        
    end

    def add_to_basket
        set_phone_for_basket do |phone|
            @phone = phone
            @basket_el = Basket.create(phone: @phone, guest_user: @guest_user, count: params[:count])
            render json: @basket_el, 
                        include: "*.*", 
                        adapter: :json,
                        status: 200
        end
    end

    def remove_from_basket
        set_basket do |basket_el|
            @basket_el = basket_el
            @basket_el.destroy
            render json: @basket_el, 
                include: "*.*", 
                adapter: :json,
                status: 200
        end
    end

    
    private 

    def set_basket
        @guest_user = GuestUser.find_by!(token: params[:guest_user_id])
        @phone = Phone.find(params[:phone_id])
        @basket_el = Basket.find_by!(guest_user: @guest_user, phone: @phone)
        yield(@basket_el)   
    
    end

    def set_phone_for_basket
        @guest_user = GuestUser.find_by!(token: params[:guest_user_id])
        @phone = Phone.find(params[:phone_id])
        yield(@phone)
    end

    def set_basket_for_action
        @guest_user = GuestUser.find_by!(token: params[:guest_user_id])
        @basket_el = Basket.find(params[:basket_id])
        yield(@basket_el)

    end
end


