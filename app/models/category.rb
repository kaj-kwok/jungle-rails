class Category < ApplicationRecord

  has_many :products
  validates :name, :uniqueness => true

  def number_of_products
    products.size
  end
end
