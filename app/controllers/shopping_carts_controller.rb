class ShoppingCartsController < ApplicationController
  before_filter :extract_shopping_cart

  def create
    @plan = Plan.find(params[:plan_id])
    @shopping_cart.add(@plan, (@plan.price * @plan.sqfoot))
    redirect_to shopping_cart_path
  end


  def remove_item
  end

  def show

  end

  private
  def extract_shopping_cart
    shopping_cart_id = session[:shopping_cart_id]
    @shopping_cart = session[:shopping_cart_id] ? ShoppingCart.find(shopping_cart_id) : ShoppingCart.create
    session[:shopping_cart_id] = @shopping_cart.id
  end
end