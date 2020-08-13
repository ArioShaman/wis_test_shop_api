# == Schema Information
#
# Table name: guest_users
#
#  id         :bigint           not null, primary key
#  token      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class GuestUser < ApplicationRecord
    has_many :personal_datas
    has_many :wish_lists
    has_many :shoping_carts
end
