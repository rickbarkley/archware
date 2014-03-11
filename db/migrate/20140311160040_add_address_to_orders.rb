class AddAddressToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :name, :string
    add_column :orders, :address_1, :string
    add_column :orders, :address_2, :string
    add_column :orders, :city, :string
    add_column :orders, :zip, :string
  end
end
