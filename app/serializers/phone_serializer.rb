# == Schema Information
#
# Table name: phones
#
#  id         :bigint           not null, primary key
#  name       :string           default("")
#  price      :string           default("")
#  image      :string           default("")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PhoneSerializer < ActiveModel::Serializer
    attributes :id, 
               :name, 
               :price, 
               :image

    def image
        object.image.url
    end

end
