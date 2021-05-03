# frozen_string_literal: true

class AddShowUnavailableChaptersToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :show_unavailable_chpaters, :boolean, null: false, default: false
  end
end
