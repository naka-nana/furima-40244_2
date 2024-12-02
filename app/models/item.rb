class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  belongs_to :region
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :shipping_day
end
