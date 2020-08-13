# == Schema Information
#
# Table name: guest_users
#
#  id         :bigint           not null, primary key
#  token      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class GuestUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
