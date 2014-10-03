class AddCountryToGetaways < ActiveRecord::Migration
  def change
    add_column :getaways, :country, :string
  end
end
