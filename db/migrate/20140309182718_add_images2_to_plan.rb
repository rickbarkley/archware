class AddImages2ToPlan < ActiveRecord::Migration
  def change
    add_column :plans, :image2, :string
    add_column :plans, :image3, :string
    add_column :plans, :image4, :string
    add_column :plans, :image5, :string
  end
end
