# frozen_string_literal: true

class AddShowModeratedPostsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :show_moderated_posts, :boolean, null: false, default: false
  end
end
