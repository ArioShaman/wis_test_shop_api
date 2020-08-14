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
    has_many :personal_datas, dependent: :destroy
    has_many :wish_lists, dependent: :destroy
    has_many :shoping_carts, dependent: :destroy

    has_many :comments, dependent: :destroy
end
