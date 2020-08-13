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
#
class CommentSerializer < ActiveModel::Serializer
    attributes  :id,
                :text,
                :created_at,
                :updated_at
end
