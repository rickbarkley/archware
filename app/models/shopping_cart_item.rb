class ShoppingCartItem < ActiveRecord::Base
  attr_accessible :title, :body, :item, :price, :quantity
  acts_as_shopping_cart_item
end
