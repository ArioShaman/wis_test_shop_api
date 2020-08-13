# == Schema Information
#
# Table name: wish_lists
#
#  id            :bigint           not null, primary key
#  guest_user_id :bigint
#  phone_id      :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'test_helper'

class WishListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
