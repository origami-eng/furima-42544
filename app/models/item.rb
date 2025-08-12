class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :name,                   presence: true
  validates :description,            presence: true
  validates :category_id,            numericality: { other_than: 1 }
  validates :condition_id,           numericality: { other_than: 1 }
  validates :shipping_fee_charge_id, numericality: { other_than: 1 }
  validates :state_id,               numericality: { other_than: 1 }
  validates :price,                  presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :shipping_time_id,       numericality: { other_than: 1 }
  validates :user,                   presence: true
  validates :image,                  presence: true

  belongs_to :user
  belongs_to :condition
  belongs_to :shipping_fee_charge
  belongs_to :state
  belongs_to :shipping_time
  has_one_attached :image
end
