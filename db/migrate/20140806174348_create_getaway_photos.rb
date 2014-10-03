class CreateGetawayPhotos < ActiveRecord::Migration
  def change
    create_table :getaway_photos do |t|
      t.attachment :photo
      t.string     :photo_file_name
      t.string     :photo_content_type
      t.integer    :photo_file_size
      t.datetime   :photo_updated_at
      t.references :getaway
    end
  end
end
