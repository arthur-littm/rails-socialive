class Livestream < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :tickets, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :donations, dependent: :destroy
  has_many :products, dependent: :destroy

  has_attachment :main_picture

  validates :main_picture, presence: true
  validates :hour_of_stream, presence: true
  validates :tickets_available, presence: true
  validates :category, presence: true
  validates :user_id, presence: true
  validates :title, presence: true
  validates :ticket_price, presence: true
  validates :description, presence: true

  before_create :set_room_name

  def self.search(pattern)
    user = User.where('first_name LIKE ? OR last_name LIKE ?', "%#{pattern}%", "%#{pattern}%").first
    if pattern.blank?  # blank? covers both nil and empty string
      all
    else
      query = where('category LIKE ? OR title LIKE ? OR description LIKE ?', "%#{pattern.downcase}%", "%#{pattern.downcase}%", "%#{pattern.downcase}%")
      query = query.or(where('user_id = ?', user.id)) if user
      query
    end
  end

  private

  def set_room_name
    roomname = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
    self.room_name = roomname
  end

end
