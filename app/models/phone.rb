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
class Phone < ApplicationRecord
	mount_uploader :image, ItemImageUploader

    has_many :comments, as: :commentable, dependent: :destroy
end
