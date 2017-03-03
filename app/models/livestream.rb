class Livestream < ApplicationRecord
  belongs_to :user
  has_many :messages

  has_attachment :main_picture

  before_create :set_room_name

  def self.search(pattern)
    user = User.where('first_name LIKE ?', "%#{pattern}%").first
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
