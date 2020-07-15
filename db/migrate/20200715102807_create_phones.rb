class CreatePhones < ActiveRecord::Migration[6.0]
    def change
        create_table :phones do |t|
            t.string :name, default: "", presence: true
            t.string :price, default: "", presence: true
            t.string :image, default: ""
            
            t.timestamps
        end
    end
end
