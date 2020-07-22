class OrderMailer < ApplicationMailer
    default :from => 'em5004.pileof.tech'

    def send_order_data(order)
        @user = order.personal_data.email
        @total_cost = 0
        order.baskets.each do |basket|
            @total_cost += basket.phone.price.to_f * basket.count
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
