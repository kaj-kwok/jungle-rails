class Review < ApplicationRecord
  belongs_to :product

  validates :product_id, presence: true
  validates :user_id, presence: true
  validates :description, presence: true
  validates :rating , presence: true, numericality: { only_integer: true, in: 1..5 }
end
