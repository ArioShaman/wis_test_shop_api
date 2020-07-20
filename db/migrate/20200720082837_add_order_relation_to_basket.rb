class AddOrderRelationToBasket < ActiveRecord::Migration[6.0]
    def change
        add_reference :baskets, :order, index: true
    end
end
