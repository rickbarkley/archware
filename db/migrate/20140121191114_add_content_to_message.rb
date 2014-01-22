class AddContentToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :name, :string
    add_column :messages, :email, :string
    add_column :messages, :content, :string
  end
end
