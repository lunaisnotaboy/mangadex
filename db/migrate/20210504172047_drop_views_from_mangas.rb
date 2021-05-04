# frozen_string_literal: true

class DropViewsFromMangas < ActiveRecord::Migration[6.0]
  def down
    remove_column :mangas, :views
  end
end
