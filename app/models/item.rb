class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_details
  belongs_to :genre

  has_one_attached :item_image

  def tax_price
    ((price * 1.1).round(2)).round
  end

end
