class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :handling_time


  has_one_attached :image
  belongs_to :user

  with_options numericality: {other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :handling_time_id
  end

  with_options presence: true do
    validates :item_name
    validates :description
    validates :price
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :handling_time_id
  end

  with_options length: {maximum: 40} do
    validates :item_name 
    validates :condition_id 
    validates :postage_id 
    validates :prefecture_id
    validates :handling_time_id
  end

  validates :price, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}

  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}

  validates :description, length: {maximum: 1000}

end