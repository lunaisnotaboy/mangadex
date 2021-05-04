# frozen_string_literal: true

class CreateViews < ActiveRecord::Migration[6.0]
  def change
    create_table :views do |t|
      t.text :type, array: true, default: []

      t.belongs_to :users, foreign_key: true
      t.belongs_to :mangas, foreign_key: true
      t.belongs_to :chapters, foreign_key: true

      t.timestamps
    end
  end
end
