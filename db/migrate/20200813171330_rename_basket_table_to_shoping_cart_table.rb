class RenameBasketTableToShopingCartTable < ActiveRecord::Migration[6.0]
    def self.up
        rename_table :baskets, :shoping_carts
    end

    def self.down
        rename_table :shoping_carts, :baskets
    end
end
