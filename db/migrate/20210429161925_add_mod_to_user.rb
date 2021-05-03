# frozen_string_literal: true

class AddModToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :mod, :boolean, default: false
  end
end
