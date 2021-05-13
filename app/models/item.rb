class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :duration
  belongs_to :user
  has_one_attached :image
  # has_one :record

  with_options presence: true do
    validates :item_name
    validates :item_info
    validates :item_price
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :duration_id
    validates :image
  end
  validates :item_name, length: { maximum: 40 }
  validates :item_info, length: { maximum: 1000 }

  validates :item_price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :shipping_fee_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :duration_id, numericality: { other_than: 1 } 

  validates :item_price, format: {with: /\A[0-9]+\z/ }
end
