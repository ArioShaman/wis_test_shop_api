class GuestUserSerializer < ActiveModel::Serializer
    attribute :id

    has_many :baskets
    has_many :wish_lists

    def id
        object.token
    end
end
