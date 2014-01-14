class AddStudyToPlan < ActiveRecord::Migration
  def change
    add_column :plans, :study2, :string
    add_column :plans, :casita2, :string
    add_column :plans, :media2, :string
  end
end
