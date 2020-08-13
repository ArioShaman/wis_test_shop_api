class ShopingCartSerializer < ActiveModel::Serializer
    attributes :id, 
               :count,
               :created_at
    
    belongs_to :phone


end
