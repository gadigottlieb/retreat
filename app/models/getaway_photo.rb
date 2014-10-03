class GetawayPhoto < ActiveRecord::Base
  belongs_to :getaway

  has_attached_file :photo, :default_url => 'assets/missing.jpg'
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
