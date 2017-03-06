class Question < ApplicationRecord
  belongs_to :user
  belongs_to :livestream

  validates :inquiry, presence: true
end
