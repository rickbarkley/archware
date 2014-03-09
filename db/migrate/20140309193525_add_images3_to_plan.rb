class AddImages3ToPlan < ActiveRecord::Migration
  def change
    add_column :plans, :image6, :string
  end
end
