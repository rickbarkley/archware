class Cart
  attr_reader :items
  
  def initialize
    @items = []
  end
  
  def add_to_cart(plan)
    @items << plan
  end
end