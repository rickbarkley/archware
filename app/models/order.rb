# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  plan_id    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ActiveRecord::Base
  attr_accessible :plan_id, :user_id, :stripe_card_token, :plan_cost
  attr_accessor :stripe_card_token, :plan_cost
  belongs_to :plan
  belongs_to :user
  accepts_nested_attributes_for :plan
  
  def save_with_payment
      
      @amount = (self.plan.price * self.plan.sqfoot * 100).to_i  
      
      if valid?
          charge = Stripe::Charge.create(amount: @amount, currency: 'usd', card: stripe_card_token)
       
          save!
      end
      rescue Stripe::InvalidRequestError => e
      logger.error "Stripe error while creating customer: #{e.message}"
      errors.add :base, "There was a problem with your credit card."
      false
  end
end
