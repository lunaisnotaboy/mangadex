# frozen_string_literal: true

class AddExcludedTagsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :excluded_tags, :text, null: false, default: ''
  end
end
