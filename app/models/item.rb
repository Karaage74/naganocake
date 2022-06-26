class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_details
  has_many :favorites, dependent: :destroy
  has_many :favorited_customer, through: :favorites, source: :customer
  has_many :item_comments, dependent: :destroy

  has_one_attached :item_image

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  def with_tax_price
    (price_without_tax * 1.1).floor
  end
end
