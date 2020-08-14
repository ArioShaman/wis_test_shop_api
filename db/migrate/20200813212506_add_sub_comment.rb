class AddSubComment < ActiveRecord::Migration[6.0]
    def change
        add_reference :comments, :comment, index: true
    end
end
