class BasketsController < ApplicationController

    def increment
        # Можно было бы получать обьект корзины напрямую, но для какой-то видимости 
        # аутенфикации делается проверка на существование user и у него уже получаем обьект
        set_basket_for_action do |basket_el|
            @basket_el = basket_el
            @basket_el.update(count: @basket_el.count + 1)
            render json: {
                msg: 'ok',
                error: false
            }
        end
    end

    def decrement
        set_basket_for_action do |basket_el|
            @basket_el = basket_el
            if @basket_el.count != 1
                @basket_el.update(count: @basket_el.count - 1)
                render json: {
                    msg: "ok",
                    error: false
                }
            else
                render json: {
                    msg: "Count can't be less than 1 ",
                    error: true
                }
            end
        end        
    end

    def add_to_basket
        set_basket do |basket_el|
            @basket_el = basket_el
            if @basket_el.present?
                # добавить количество
                @basket_el.update(count: (@basket_el.count + params[:count]))
            else
                # новый элемент корзины
                @basket_el = Basket.create(phone: @phone, guest_user: @guest_user, count: params[:count])
            end
            return @basket_el
        end
    end

    def remove_from_basket
        set_basket do |basket_el|
            @basket_el = basket_el
            if @basket_el.present?
                @basket_el.destroy
                return @basket_el
            else
                render json: {
                    msg: "BasketEl not found",
                    error: true
                }
            end
        end
    end

    private 
    def set_basket
        @guest_user = GuestUser.where(token: params[:guest_user_id]).first
        if @guest_user.present?
            @phone = Phone.find(params[:phone_id])
            if @phone.present?
                @basket_el = Basket.where(guest_user: @guest_user, phone: @phone).first
                yield(@basket_el)
            else
                render json: {
                    msg: "Phone not found",
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

    def set_basket_for_action
        @guest_user = GuestUser.where(token: params[:guest_user_id]).first
        if @guest_user.present?
            @basket_el = Basket.find(params[:basket_id])
            yield(@basket_el)
        else
            render json: {
                msg: "User not found",
                error: true
            }
        end
    end
end







