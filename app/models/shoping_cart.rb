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
class ShopingCart < ApplicationRecord
    belongs_to :guest_user, optional: true 
    belongs_to :phone
    belongs_to :order, optional: true

    scope :not_ordered, -> { where(order: nil) }

end
