class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :dashboard ]

  def home
  end

  def dashboard
    @user = current_user
  end

  def profile_update
    @user = current_user
    @user.update(profile_params)
  end

  private

  def profile_params
    params.require(:user).permit(:facebooklink, :twitterlink, :instagramlink, :youtubelink, :snapchatlink, :bio, :fav1title, :fav2title, :fav3title, :fav1, :fav2, :fav3)
  end

end
