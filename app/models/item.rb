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
    validates :item_name, :description, :price, length: {maximum: 40}
    validates :description, length: {maximum: 1000}
    validates :category_id, numericality: { other_than: 1 } 
    validates :price, numericality: {}
  end

end
