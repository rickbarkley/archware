class AddPicToImage < ActiveRecord::Migration
  def change
    add_column :images, :pic, :string
  end
end
