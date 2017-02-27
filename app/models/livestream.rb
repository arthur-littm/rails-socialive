class Livestream < ApplicationRecord
  belongs_to :user

  def self.search(pattern)
    if pattern.blank?  # blank? covers both nil and empty string
      all
    else
      where('category LIKE ? title LIKE ?', "%#{pattern}% %#{pattern}%")
    end
  end



end
