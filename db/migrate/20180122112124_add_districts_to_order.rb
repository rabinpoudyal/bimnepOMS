class AddDistrictsToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :district, :string
  end
end
