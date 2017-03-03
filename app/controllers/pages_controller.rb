class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @adventure_livestreams = Livestream.all.where(category: 'adventure')
    @fitness_livestreams = Livestream.all.where(category: 'fitness')
    # add more categories when cards are complete #
  end

  def dashboard
    @user = current_user
    @mylivestreams = Livestream.all.where(user_id: current_user)
  end

  def profile_update
    @user = current_user
    @user.update(profile_params)
    redirect_to root_path, notice: "Your profile has be updated"
  end

  def following
    @title = "Following"
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

  def profile_params
    params.require(:user).permit(:facebooklink, :twitterlink, :instagramlink, :youtubelink, :snapchatlink, :bio, :fav1title, :fav2title, :fav3title, :fav1, :fav2, :fav3, :profilepic, images: [], :first_name, :last_name, :following, :followers)

  end

end
