# frozen_string_literal: true

class AddModToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :mod, :boolean, null: false, default: false
  end
end
