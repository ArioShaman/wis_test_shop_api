class OrderMailer < ApplicationMailer
    default :from => 'em5004.pileof.tech'

    def send_order_data(order)
        @user = order.personal_data.email
        @total_cost = 0
        order.shoping_carts.each do |shoping_cart|
            @total_cost += shoping_cart.phone.price.to_f * shoping_cart.count
        end

        @order = order
        mail( 
            to: @user,
            subject: 'Сделан заказ',
            locals: {
                order: @order,
                total_cost: @total_cost
            }
        )
    end 
end
