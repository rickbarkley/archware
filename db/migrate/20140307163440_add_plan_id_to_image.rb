class AddPlanIdToImage < ActiveRecord::Migration
  def change
    add_column :images, :plan_id, :integer
  end
end
