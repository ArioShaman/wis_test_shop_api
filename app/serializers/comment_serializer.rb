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
class CommentSerializer < ActiveModel::Serializer
    attribute :owner
    # attribute :comments

    attributes  :id,
                :text,
                :created_at

    has_many :comments

    def owner
        object.guest_user.token
    end



end
