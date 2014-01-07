class AddPlanToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :study, :string
    add_column :plans, :garage_loc, :string
    add_column :plans, :media, :boolean
    add_column :plans, :casita, :boolean
    add_column :plans, :quart, :boolean
    add_column :plans, :style, :string
  end
end
