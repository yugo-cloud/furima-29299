class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condetion
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :handling_time


  has_one_attached :image
  belongs_to :user

  wirh_options presence: true do
    validates :item_name, :condition_id, :postage_id, :prefecture_id, :handling_time_id, length: {maximum: 40}
    validates :description, length: {maximum: 1000}
    validates :category_id, numericality: { other_than: 1 message: "can't be blank"} 
    validates :price, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}
  end

end
