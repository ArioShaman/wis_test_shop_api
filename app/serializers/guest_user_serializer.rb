class GuestUserSerializer < ActiveModel::Serializer
    attribute :id

    has_many :shoping_carts
    has_many :wish_lists

    def id
        object.token
    end
end
