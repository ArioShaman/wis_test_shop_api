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
class WishListSerializer < ActiveModel::Serializer
    attributes :id, 
               :created_at

    belongs_to :phone
    
end
