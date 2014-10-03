class RemovePlaceIdFromGetaways < ActiveRecord::Migration
  def change
    remove_column :getaways, :place_id
  end
end
