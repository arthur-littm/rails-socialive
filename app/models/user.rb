class User < ApplicationRecord
  has_many :livestreams, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :tickets, dependent: :destroy

  has_attachment :profilepic
  has_attachments :images, maximum: 10

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  before_create :set_color
  before_create :set_icon

    def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  #sets name for the chat

  def name
    self.first_name || "anon"
    # email.split('@')[0]
  end

  def feed
  end

  # Follows a user.
  def follow(other_user)
    following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  def set_color
    color_pick = ["red", "green", "blue", "orange", "pink", "purple", "brown", "#0E402D", "#295135", "#5A6650", "#9FCC2E", "#B4654A", "#157A6E", "#0B3948", "#416165", "#CB8589", "#E8D2AE", "#796465", "#E34A6F", "#F7B2BD", "#60A561", "#B2A198", "#053225", "#37718E", "#8EE3EF", "#254E70", "#028090", "#DBABBE", "#EDBBB4", "#D8315B", "#0A2463", "#3E92CC", "#C52233", "#A51C30", "#A7333F", "#74121D", "#580C1F", "#01FDF6", "#FB5012", "#CBBAED", "#E9DF00", "#03FCBA", "#8E3B46", "#E1DD8F", "#E0777D", "#4C86A8", "#E9CE2C", "#BF211E", "#F9DC5C", "#69A197", "#C14953","#A6FFA1", "#4DFFF3" ].sample
    self.color = color_pick
  end

  def set_icon
    icon_pick = ["diamond.svg", "mask.svg", "balloon.svg"].sample
    self.icon = icon_pick
  end


end
