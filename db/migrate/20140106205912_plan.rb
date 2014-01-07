class AddStyleToPlan < ActiveRecord::Migration
  def up
  	add_column :plans, :style, :string
    add_column :plans, :garage_loc, :string
    add_column :plans, :casita, :boolean
    add_column :plans, :media, :boolean
    add_column :plans, :quartyard, :boolean
    add_column :plans, :study, :boolean
  end

  def down
  end
end
