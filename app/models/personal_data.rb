# == Schema Information
#
# Table name: personal_data
#
#  id            :bigint           not null, primary key
#  full_name     :string
#  phone         :string
#  email         :string
#  address       :string
#  comment       :string
#  guest_user_id :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class PersonalData < ApplicationRecord
    belongs_to :guest_user, optional: true
    validates :full_name, :phone, :email, :address, presence: true
end
