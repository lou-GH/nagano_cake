class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  # enum is_deleted: { false: 0, true: 1 }

  # def active_for_authentication?
  #   super && (is_deleted == false)
  # end

  def customer_status
    if is_deleted
      "退会"
    else
      "有効"
    end
  end

end
