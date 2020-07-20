class CreatePersonalData < ActiveRecord::Migration[6.0]
    def change
        create_table :personal_data do |t|
            t.string :full_name, presence: true
            t.string :phone, presence: true
            t.string :email, presence: true
            t.string :address, presence: true
            t.string :comment

            t.belongs_to :guest_user
            t.timestamps
        end
    end
end
