# == Schema Information
#
# Table name: baskets
#
#  id            :bigint           not null, primary key
#  guest_user_id :bigint
#  phone_id      :bigint
#  count         :integer          default(1)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  order_id      :bigint
#
require 'test_helper'

class BasketTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
