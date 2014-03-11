class SavedPlan < ActiveRecord::Base
  attr_accessible :email, :name, :plan_id, :user_id

  belongs_to :user
  belongs_to :plan
  accepts_nested_attributes_for :plan
end
