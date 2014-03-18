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

class Plan < ActiveRecord::Base
  attr_accessible :garage, :images_attributes, :bathrooms, :bedrooms, :dining, :half_bath, :levels, :living, :name, :price, :sqfoot, :stories, :suite, :view,
  :drawing_1_file_name, :drawing_1_content_type, :drawing_1_file_size, :drawing_1_updated_at, :drawing_2_file_name, :drawing_2_content_type,
  :drawing_2_file_size, :drawing_2_updated_at, :elevation_file_name, :elevation_content_type, :elevation_file_size, :elevation_updated_at,
  :drawing_1, :drawing_2, :elevation, :width, :depth, :media, :study, :style, :casita, :media2, :study2, :casita2, :quart, :garage_loc, :image,
  :image2, :image3, :image4, :image5, :image7, :image8, :image9, :image10,:image11, :delete_photo, :delete_photo2, :delete_photoe  
  #attr_accessor :_destroy
  has_attached_file :drawing_1,  :styles => { :full => ["2400x2400>", :jpg], :preview => ["365x365>", :jpg], :thumb => ["150x150>", :jpg] }
  has_attached_file :drawing_2,  :styles => { :full => ["2400x2400>", :jpg], :preview => ["365x365>", :jpg], :thumb => ["150x150>", :jpg] }
  has_attached_file :elevation,  :styles => { :full => ["2400x2400>", :jpg], :preview => ["365x365>", :jpg], :thumb => ["150x150>", :jpg] }
  #has_attached_file :image,  :styles => { :full => ["2400x2400>", :jpg], :preview => ["365x365>", :jpg], :thumb => ["150x150>", :jpg] }

  has_many :orders, :dependent => :destroy
  has_many :users, through: :orders 
  has_many :images, :dependent => :destroy 
  has_many :shopping_carts
  has_many :shopping_cart_items 
  has_many :users, through: :saved_plans
  has_many :saved_plans, :dependent => :destroy
  accepts_nested_attributes_for :saved_plans

  accepts_nested_attributes_for :images, :allow_destroy => true   

  mount_uploader :image2, ImageUploader   
  mount_uploader :image3, ImageUploader  
  mount_uploader :image4, ImageUploader  
  mount_uploader :image5, ImageUploader 
  mount_uploader :image7, ImageUploader 
  mount_uploader :image8, ImageUploader 
  mount_uploader :image9, ImageUploader 
  mount_uploader :image10, ImageUploader 
  mount_uploader :image11, ImageUploader

  def accessible_to_user_by_saved?(user)
        #Look for course enrollments that belong to given user and have not expired
       saved_plans = self.saved_plans.where("user_id = ?", user.id)
       !saved_plans.blank? # Returns true if there is at least one registration found, otherwise returns false
    end 

    before_validation :clear_photo
    before_validation :clear_photo2
    before_validation :clear_photoe
     
  def delete_photo=(value)
    @delete_photo = !value.to_i.zero?
  end
  
  def delete_photo
    !!@delete_photo
  end
  alias_method :delete_photo?, :delete_photo
  
  def clear_photo
    self.drawing_1 = nil if delete_photo?

  end

  ##
    def delete_photo2=(value)
    @delete_photo2 = !value.to_i.zero?
  end
  
  def delete_photo2
    !!@delete_photo2
  end
  alias_method :delete_photo2?, :delete_photo2
  
  def clear_photo2
    self.drawing_2 = nil if delete_photo2?
  end

  ##
    def delete_photoe=(value)
    @delete_photoe = !value.to_i.zero?
  end
  
  def delete_photoe
    !!@delete_photoe
  end
  alias_method :delete_photoe?, :delete_photoe
  
  def clear_photoe
    self.elevation = nil if delete_photoe?
  end

end
