class AddPhone2ToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :phone, :string
    add_column :orders, :email, :string
  end
end
