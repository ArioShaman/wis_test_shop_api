# == Schema Information
#
# Table name: guest_users
#
#  id         :bigint           not null, primary key
#  token      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class GuestUserSerializer < ActiveModel::Serializer
    attribute :id

    has_many :shoping_carts
    has_many :wish_lists

    def id
        object.token
    end
end
