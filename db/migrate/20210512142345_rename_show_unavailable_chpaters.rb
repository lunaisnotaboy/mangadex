# frozen_string_literal: true

class RenameShowUnavailableChpaters < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :show_unavailable_chpaters, :show_unavailable_chapters
  end
end
