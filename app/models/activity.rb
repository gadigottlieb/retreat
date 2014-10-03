class Activity < ActiveRecord::Base
  belongs_to :getaway

  validates :name, :category, :getaway_id, presence: true
  validates :category, inclusion: { in: %w( stay eat play ) }
end
