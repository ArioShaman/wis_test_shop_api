class PhonesController < ApplicationController
    def index
        @phones = Phone.all.order('price::float DESC')
        render json: @phones, status: 200, adapter: :json
    end
end
    