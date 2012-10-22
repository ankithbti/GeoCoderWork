class AddColumnCityZipcodeCountryToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :city, :string
    add_column :locations, :zipcode, :string
    add_column :locations, :country, :string
  end
end
