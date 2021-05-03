# frozen_string_literal: true

class AddAvatarToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :avatar, :text
  end
end
