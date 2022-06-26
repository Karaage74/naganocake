class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_details
  has_many :favorites, dependent: :destroy
  has_many :favorited_customer, through: :favorites, source: :customer
  has_many :item_comments, dependent: :destroy

  has_one_attached :item_image
  
  def get_item_image(width, height)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    item_image.variant(resize_to_limit:[width, height]).processed
  end

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  def with_tax_price
    (price_without_tax * 1.1).floor
  end
end
