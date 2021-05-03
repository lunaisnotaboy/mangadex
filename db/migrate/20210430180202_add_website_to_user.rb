# frozen_string_literal: true

class AddWebsiteToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :website, :string, null: false, default: ''
  end
end
