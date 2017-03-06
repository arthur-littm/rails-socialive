class Ticket < ApplicationRecord
  belongs_to :livestream
  belongs_to :user
end
