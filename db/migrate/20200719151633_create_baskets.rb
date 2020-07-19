class CreateBaskets < ActiveRecord::Migration[6.0]
    def change
        create_table :baskets do |t|
            t.belongs_to :guest_user
            t.belongs_to :phone
            t.integer :count, default: 1, presence: true

            t.timestamps
        end
    end
end
