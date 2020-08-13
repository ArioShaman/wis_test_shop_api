# == Schema Information
#
# Table name: wish_lists
#
#  id            :bigint           not null, primary key
#  guest_user_id :bigint
#  phone_id      :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class WishList < ApplicationRecord
    belongs_to :guest_user, optional: true 
    belongs_to :phone, optional: true 

    validates :phone_id, presence: true
end
