class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :facebooklink, :string
    add_column :users, :twitterlink, :string
    add_column :users, :instagramlink, :string
    add_column :users, :youtubelink, :string
    add_column :users, :snapchatlink, :string
    add_column :users, :bio, :text
    add_column :users, :fav1title, :string
    add_column :users, :fav2title, :string
    add_column :users, :fav3title, :string
    add_column :users, :fav1, :text
    add_column :users, :fav2, :text
    add_column :users, :fav3, :text
  end
end
