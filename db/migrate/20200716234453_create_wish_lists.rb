class CreateWishLists < ActiveRecord::Migration[6.0]
    def change
        create_table :wish_lists do |t|
            t.belongs_to :guest_user
            t.belongs_to :phone

            t.timestamps
        end
    end
end
