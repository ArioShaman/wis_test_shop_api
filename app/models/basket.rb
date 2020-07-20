class Basket < ApplicationRecord
    belongs_to :guest_user, optional: true 
    belongs_to :phone, optional: true
    belongs_to :order, optional: true

    scope :not_ordered, -> { where(order: nil) }

end
