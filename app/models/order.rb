class Order < ApplicationRecord
    belongs_to :personal_data, optional: true
    has_many :baskets
end
