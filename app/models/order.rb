# == Schema Information
#
# Table name: orders
#
#  id               :bigint           not null, primary key
#  personal_data_id :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Order < ApplicationRecord
    belongs_to :personal_data, optional: true
    has_many :baskets
end
