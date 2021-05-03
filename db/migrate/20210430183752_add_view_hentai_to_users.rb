# frozen_string_literal: true

class AddViewHentaiToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :view_hentai, :boolean, null: false, default: false
  end
end
