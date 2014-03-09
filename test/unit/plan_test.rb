# == Schema Information
#
# Table name: plans
#
#  id                     :integer          not null, primary key
#  bedrooms               :integer
#  sqfoot                 :integer
#  levels                 :integer
#  bathrooms              :integer
#  price                  :decimal(, )
#  name                   :string(255)
#  half_bath              :integer
#  living                 :integer
#  suite                  :string(255)
#  stories                :string(255)
#  dining                 :integer
#  view                   :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  drawing_1_file_name    :string(255)
#  drawing_1_content_type :string(255)
#  drawing_1_file_size    :integer
#  drawing_1_updated_at   :datetime
#  drawing_2_file_name    :string(255)
#  drawing_2_content_type :string(255)
#  drawing_2_file_size    :integer
#  drawing_2_updated_at   :datetime
#  elevation_file_name    :string(255)
#  elevation_content_type :string(255)
#  elevation_file_size    :integer
#  elevation_updated_at   :datetime
#  garage                 :integer
#  width                  :string(255)
#  depth                  :string(255)
#  plan_cost              :decimal(, )
#  study                  :string(255)
#  garage_loc             :string(255)
#  media                  :boolean
#  casita                 :boolean
#  quart                  :boolean
#  style                  :string(255)
#  study2                 :string(255)
#  casita2                :string(255)
#  media2                 :string(255)
#  image_file_name        :string(255)
#  image_content_type     :string(255)
#  image_file_size        :integer
#  image_updated_at       :datetime
#  image2                 :string(255)
#  image3                 :string(255)
#  image4                 :string(255)
#  image5                 :string(255)
#

require 'test_helper'

class PlanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
