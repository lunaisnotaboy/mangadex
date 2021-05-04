# frozen_string_literal: true

class DropViewsFromChapters < ActiveRecord::Migration[6.0]
  def change
    remove_column :chapters, :views
  end
end
