class AddState2ToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :state2, :integer
  end
end
