class WishListSerializer < ActiveModel::Serializer
    attributes :id, 
               :created_at

    belongs_to :phone
    
end
