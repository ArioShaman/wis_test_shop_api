# == Schema Information
#
# Table name: shoping_carts
#
#  id            :bigint           not null, primary key
#  guest_user_id :bigint
#  phone_id      :bigint
#  count         :integer          default(1)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  order_id      :bigint
#
class ShopingCartSerializer < ActiveModel::Serializer
    attributes :id, 
               :count,
               :created_at
    
    belongs_to :phone


end
