class Product < ApplicationRecord
  belongs_to :livestream
  belongs_to :user

  has_attachment :product_pic
end
