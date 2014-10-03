class CreateGetaways < ActiveRecord::Migration
  def change
    create_table :getaways do |t|
      t.date :date
      t.text :comment
      t.references :place
      t.references :user

      t.timestamps
    end
  end
end
