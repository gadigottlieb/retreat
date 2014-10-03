class User < ActiveRecord::Base
  has_secure_password

  has_attached_file :avatar, :default_url => 'missing.png'
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


  has_many :getaways, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, :through => :friendships
  has_many :friend_requests, dependent: :destroy

  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  validates :email, :first_name, :last_name, :password_confirmation, :password, presence: true
  validates :email, uniqueness: true

  validates :password, length: { minimum: 8 }

end
