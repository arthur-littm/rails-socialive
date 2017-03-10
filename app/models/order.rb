class Order < ApplicationRecord

  PACKS = {
    pack1: { rubies: 100, price: 5 },
    pack2: { rubies: 200, price: 10 },
    pack3: { rubies: 500, price: 20 },
  }

  monetize :amount_pennies  # or :amount_pennies
end
