class RemoveDateFromGetaways < ActiveRecord::Migration
  def change
    remove_column :getaways, :date
  end
end
