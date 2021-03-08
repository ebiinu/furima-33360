class Item < ApplicationRecord
  validates :name, :introduction, :price, :image, presence: true
  validates :category_id, :condition_id, :delivery_fee_payer_id, :prefecture_id, :preparing_day_id, numericality: { other_than: 1 }
  validates :price, format: { with: greater_than_or_equal_to: 300, message: "is invalid. Price must be over 300 yen."}
  validates :price, format: { with: less_than_or_equal_to: 99999999, message: "is invalid. Price must be under 100000000 yen."}
  validates :price, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/, message: "is invalid. Input half-width numbers."}





  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee_payer
  belongs_to :prefecture
  belongs_to :preparing_day
end
