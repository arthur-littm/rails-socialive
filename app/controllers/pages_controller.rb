class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @fitness_livestreams = Livestream.all.where(category: 'fitness')
    @fashion_livestreams = Livestream.all.where(category: 'fashion')
    @foodie_livestreams = Livestream.all.where(category: 'foodie')
    @yoga_livestreams = Livestream.all.where(category: 'yoga')
    # add more categories when cards are complete #
  end

  def dashboard
    @user = current_user
    @mylivestreams = Livestream.all.where(user_id: current_user)
    @tickets = Ticket.where(user: @user)
    @my_subscriptions = @user.following
  end

  def become_a_livestreamer
    @user = current_user
  end

  # def profile_create
  #   @user = current_user
  #   @user.create(profile_params)
  #   redirect_to dashboard_path, notice: "You are now officially a livestreamer on Socialive! When is you first livestream goind to be?"
  #   @user.livestreamer = true
  # end

  def profile_update
    @user = current_user
    @user.update(profile_params)
    redirect_to dashboard_path, notice: "Your profile has been updated"
  end

  def buy_rubies
     session[:my_previous_url] = URI(request.referer || '').path
  end

  def search
    @users = User.search(params[:query])
  end

  private

  def profile_params
    params.require(:user).permit(:livestreamer, :facebooklink, :twitterlink, :instagramlink, :youtubelink, :snapchatlink, :bio, :fav1title, :fav2title, :fav3title, :fav1, :fav2, :fav3, :profilepic, :first_name, :last_name, :following, :followers, :identification, :username_optional, :name, images: [])
  end

end
