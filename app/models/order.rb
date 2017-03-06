class Order < ApplicationRecord
  monetize :amount_pennies  # or :amount_pennies
end
