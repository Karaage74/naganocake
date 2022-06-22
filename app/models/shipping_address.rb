class ShippingAddress < ApplicationRecord
  belongs_to :customer

  def address_display
    '〒' + post_code + '' + address + '' + name
  end
  
  #validates :customer_id, :name, :address, presence: true
  #validates :postcode, length: {is: 7}, numericality: { only_integer: true }
  
end
