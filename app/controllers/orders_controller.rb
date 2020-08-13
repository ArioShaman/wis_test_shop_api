class OrdersController < ApplicationController
    ActionController::Parameters.action_on_unpermitted_parameters = :raise
    before_action :set_guest_user, only: [:create]

    def create
        personalData = PersonalData.create(form_params)
        if personalData.valid?
            order = Order.create(personal_data: personalData)
            basket_list = @guest_user.baskets
            basket_list.each do |basket|
                basket.update(order: order)
            end
            OrderMailer.send_order_data(order).deliver
            head :ok
        else
           render json: {
                msg: "Blank params",
                error: true
            } 
        end      
    end

private
    def form_params
        params.require(:formData).permit(:full_name, :phone, :email, :address, :comment).merge(guest_user_id: @guest_user.id)
    end

    def set_guest_user
        @guest_user = GuestUser.find_by!(token: params[:guest_user_id])
    end 
end
