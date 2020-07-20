class GuestUser < ApplicationRecord
    has_many :wish_lists
    has_many :baskets
end
