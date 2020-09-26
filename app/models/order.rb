class Order < ApplicationRecord
  belong_to :item
  belong_to :user
  has_one :address
end
