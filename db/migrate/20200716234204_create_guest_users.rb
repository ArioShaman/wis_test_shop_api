class CreateGuestUsers < ActiveRecord::Migration[6.0]
    def change
        create_table :guest_users do |t|
            t.string :token, presence: true
            t.timestamps
        end
    end
end
