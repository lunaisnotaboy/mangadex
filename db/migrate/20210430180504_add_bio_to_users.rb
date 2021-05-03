# frozen_string_literal: true

class AddBioToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :bio, :text, null: false, default: ''
  end
end
