class AddCityToGetaways < ActiveRecord::Migration
  def change
    add_column :getaways, :city, :string
  end
end
