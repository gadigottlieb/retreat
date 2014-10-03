class Getaway < ActiveRecord::Base
  belongs_to :user
  has_many :getaway_photos

  has_many :activities

  validates :departure_date, :user_id, presence: true
  validates :user_id, numericality: { greater_than: 0 }

end
