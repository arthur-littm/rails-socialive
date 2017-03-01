class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :dashboard ]

  def home
    @adventure_livestreams = Livestream.all.where(category: 'adventure')
    @fitness_livestreams = Livestream.all.where(category: 'fitness')
    # add more categories when cards are complete #
  end

  def dashboard
    @user = current_user
  end
end
