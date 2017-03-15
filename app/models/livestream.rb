class Livestream < ApplicationRecord
  include AlgoliaSearch

  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :tickets, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :donations, dependent: :destroy

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


  algoliasearch do
    # list of attribute used to build an Algolia record
    # attributes :title, :description, :category

    # the `searchableAttributes` (formerly known as attributesToIndex) setting defines the attributes
    # you want to search in: here `title`, `subtitle` & `description`.
    # You need to list them by order of importance. `description` is tagged as
    # `unordered` to avoid taking the position of a match into account in that attribute.
    # searchableAttributes ['title', 'category', 'unordered(description)']

    # the `customRanking` setting defines the ranking criteria use to compare two matching
    # records in case their text-relevance is equal. It should reflect your record popularity.
    # ex: customRanking ['desc(likes_count)']

    # add_attribute :streamer

    # def streamer
    #   @livestream.user.first_name
    # end

  end


# delete this section once Algolia is installed

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
