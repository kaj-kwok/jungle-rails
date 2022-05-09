module ProductHelper
  def has_quantity?
    Product.where("products.quantity > ?", 1)
  end
  
end
