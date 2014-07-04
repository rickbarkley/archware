class AddTaxToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :tax, :integer
  end
end
