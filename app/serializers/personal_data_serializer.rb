class PersonalDataSerializer < ActiveModel::Serializer
    attributes  :id,
                :full_name,
                :phone,
                :email,
                :address,
                :comment,
                :created_at
end
