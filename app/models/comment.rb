# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  text             :string
#  commentable_type :string
#  commentable_id   :bigint
#  guest_user_id    :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  comment_id       :bigint
#
class Comment < ApplicationRecord
    
    belongs_to :commentable, polymorphic: true
    belongs_to :guest_user
    
    has_many :comments

end
