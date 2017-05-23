class Order < ApplicationRecord
  has_many :carted_products
  belongs_to :item, optional: true
  belongs_to :user
end
