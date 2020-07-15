class PhonesController < ApplicationController
	def index
		@phones = Phone.all.order(price: 'desc')
		@phones
	end
end
