# frozen_string_literal: true

class AddShownChapterLangsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :shown_chapter_langs, :string, null: false, default: 'en_US'
  end
end
