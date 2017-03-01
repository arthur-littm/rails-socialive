class Livestream < ApplicationRecord
  belongs_to :user

  def self.search(pattern)
    if pattern.blank?  # blank? covers both nil and empty string
      all
    else
      where('category LIKE ? OR title LIKE ?', "%#{pattern.downcase}%", "%#{pattern.downcase}%")
    end
  end

end
