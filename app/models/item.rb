class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :handling_time

  belongs_to :user
  has_one :order
  has_many :comments
  has_one_attached :image

  with_options numericality: {other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :handling_time_id
  end

  with_options presence: true do
    validates :image
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

  validates :price, format: {with: /\A[0-9]+\z/, message: "は半角で入力して下さい"}

  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}

  validates :description, length: {maximum: 1000}

  def self.search(search)
    if search != ""
      Item.where('item_name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end

  def previous
    Item.where("id < ?", self.id).order("id DESC").first
  end

  def next
    Item.where("id > ?", self.id).order("id ASC").first
  end

end