class BasketSerializer < ActiveModel::BasketSerializer
    attributes :id, 
               :count,
               :created_at
    
    belongs_to :phone


end
