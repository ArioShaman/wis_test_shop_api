class CreateOrders < ActiveRecord::Migration[6.0]
    def change
        create_table :orders do |t|
            t.belongs_to :personal_data
            t.timestamps
        end
    end
end
