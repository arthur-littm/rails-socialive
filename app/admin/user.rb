ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
  permit_params :email, :first_name, :last_name, :livestreamer, :admin,
                :facebooklink, :twitterlink, :instagramlink, :youtubelink,
                :snapchatlink, :bio, :fav1title, :fav2title, :fav3title,
                :fav1, :fav2, :fav3, :color, :icon
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  index do
    selectable_column
    column :id
    column :created_at
    column :first_name
    column :last_name
    column :email
    column :livestreamer
    column :balance
    column :earned_balance
    column :admin
    actions
  end

end


