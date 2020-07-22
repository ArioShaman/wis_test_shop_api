class OrdersController < ApplicationController
    before_action :set_guest_user, only: [:create]

    def create
        if @guest_user.present?
            puts ">>> #{ap form_params}"
            personalData = PersonalData.create(form_params)
            if personalData.valid?
                order = Order.create(personal_data: personalData)
                basket_list = @guest_user.baskets
                basket_list.each do |basket|
                    basket.update(order: order)
                end
                OrderMailer.send_order_data(order).deliver
                render json: {
                    msg: 'Ok',
                    error: false
                }
            else
               render json: {
                    msg: "Blank params",
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

private
    def form_params
            params.require(:formData).permit(:full_name, :phone, :email, :address, :comment).merge(guest_user_id: @guest_user.id)
    end

    def set_guest_user
        @guest_user = GuestUser.where(token: params[:guest_user_id]).first
    end
    ActionController::Parameters.action_on_unpermitted_parameters = :raise

    rescue_from(ActionController::UnpermittedParameters) do |pme|
        render json: { error:  { unknown_parameters: pme.params } }, status: :bad_request
    end    
end
