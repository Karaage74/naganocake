class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items
  has_many :shipping_addresses
  has_many :orders
  has_many :favorites, dependent: :destroy
  has_many :favorite_items, through: :favorites, source: :item
  has_many :item_comments, dependent: :destroy


  def full_name
    self.last_name + "" + self.first_name
  end

  def kana_full_name
    self.last_name_kana + "" + self.first_name_kana
  end

  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  def favorited_by?(item_id)
    favorites.where(item_id: item.id).exists?
  end
end
