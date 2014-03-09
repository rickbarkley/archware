class AddAttachmentImageToPlans < ActiveRecord::Migration
  def self.up
    change_table :plans do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :plans, :image
  end
end
