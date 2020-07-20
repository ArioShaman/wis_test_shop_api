class OrdersController < ApplicationController
    before_action :set_guest_user, only: [:create]

    def create
        if @guest_user.present?
            personalData = PersonalData.create(form_params)
            order = Order.create(personal_data: personalData)
            basket_list = @guest_user.baskets
            basket_list.each do |basket|
                basket.update(order: order)
            end
            render json: {
                msg: 'Ok',
                error: false
            }
        else
            render json: {
                msg: "User not found",
                error: true
            }
        end        
    end

private
    def form_params
        params.require(:formData).permit(:full_name, :phone, :email, :address, :comment).merge(guest_user_id: @guest_user.id)
    end

    def set_guest_user
        @guest_user = GuestUser.where(token: params[:guest_user_id]).first
    end
end
