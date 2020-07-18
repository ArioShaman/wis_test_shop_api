class WishList < ApplicationRecord
    belongs_to :guest_user, optional: true 
    belongs_to :phone, optional: true 
end
