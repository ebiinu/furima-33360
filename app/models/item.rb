class Item < ApplicationRecord
  validates :name, :introduction, :price, :image, presence: true
  validates :category_id, :condition_id, :delivery_fee_payer_id, :prefecture_id, :preparing_day_id, numericality: { other_than: 1 }
  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid. Input 300 ~ 99999999 numbers."}
  validates :price, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/, message: "is invalid. Input half-width numbers."}





  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee_payer
  belongs_to :prefecture
  belongs_to :preparing_day
end
