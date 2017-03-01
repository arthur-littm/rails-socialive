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
    params.require(:user).permit(:first_name)
  end

end
