class ShoppingCart < ActiveRecord::Base
	belongs_to :plans
  attr_accessible :title, :body, :item, :price, :quantity
    acts_as_shopping_cart

      


end
