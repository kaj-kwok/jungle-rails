class Product < ApplicationRecord
  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :reviews

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def has_quantity?
    quantity > 1
  end

  def average_rating
    if reviews.count != 0
    reviews.sum(:rating) / reviews.count
    else
      0
    end
  end
  
  
end
