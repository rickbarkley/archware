# == Schema Information
#
# Table name: images
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  plan_id            :integer
#  pic                :string(255)
#

class Image < ActiveRecord::Base
  attr_accessible :name, :images_attributes, :pic, :plan_id
  belongs_to :plan

  mount_uploader :pic, ImageUploader

  include Rails.application.routes.url_helpers

  def to_jq_upload
     {
       "name" => read_attribute(:pic_file_name),
       "size" => read_attribute(:pic_file_size),
       "url" => v_upload.url(:original),
       "delete_url" => pic_path(self),
       "delete_type" => "DELETE" 
     }
   end

end
