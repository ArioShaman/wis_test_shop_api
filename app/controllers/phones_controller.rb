class PhonesController < ApplicationController
	def index
		@phones = Phone.all.order('price::float DESC')
		@phones
	end
end
