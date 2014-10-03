class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :comment
      t.string :category
      t.text :image_url
      t.references :getaway
    end
  end
end
