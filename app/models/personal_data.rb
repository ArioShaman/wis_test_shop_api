class PersonalData < ApplicationRecord
    belongs_to :guest_user, optional: true 
end
