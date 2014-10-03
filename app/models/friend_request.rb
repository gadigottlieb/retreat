class FriendRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :sender, :class_name => "User"

  validates :sender_id, :user_id, presence: true
  validates :sender_id, :user_id, numericality: { greater_than: 0 }

end
