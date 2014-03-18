class AddImage8ToPlan < ActiveRecord::Migration
  def change
    add_column :plans, :image7, :string
    add_column :plans, :image8, :string
    add_column :plans, :image9, :string
    add_column :plans, :image10, :string
    add_column :plans, :image11, :string
  end
end
