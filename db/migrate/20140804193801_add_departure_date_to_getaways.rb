class AddDepartureDateToGetaways < ActiveRecord::Migration
  def change
    add_column :getaways, :departure_date, :date
  end
end
