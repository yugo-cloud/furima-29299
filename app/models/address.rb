class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :order
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :post_code
    validates :prefecture
    validates :city
    validates :address
    validates :phone_number
  end

  validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }

  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }

  validates :phone_number, numericality: { only_integer: true, with: /\A\d{11}\z/ }
end
