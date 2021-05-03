# frozen_string_literal: true

class AddMdAtHomeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :md_at_home, :boolean, null: false, default: false
  end
end
