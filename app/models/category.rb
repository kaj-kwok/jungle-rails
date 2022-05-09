class Category < ApplicationRecord

  has_many :products
  validates :name, :uniqueness => true

  #helper to determine number of products within category
  def number_of_products
    products.size
  end
end
