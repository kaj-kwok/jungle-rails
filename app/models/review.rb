class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :product_id, presence: true
  validates :user_id, presence: true
  validates :description, presence: true
  validates :rating , presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
