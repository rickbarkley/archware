class AddFeaturedToPlan < ActiveRecord::Migration
  def change
    add_column :plans, :featured, :string
  end
end
