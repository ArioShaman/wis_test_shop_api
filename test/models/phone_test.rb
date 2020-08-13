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
require 'test_helper'

class PhoneTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
