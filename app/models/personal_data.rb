class PersonalData < ApplicationRecord
    belongs_to :guest_user, optional: true
    validates :full_name, :phone, :email, :address, presence: true
end
