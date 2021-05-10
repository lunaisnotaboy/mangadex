# frozen_string_literal: true

class CreateManga < ActiveRecord::Migration[6.0]
  def change
    create_table :manga do |t|
      t.text :titles, array: true, default: []
      t.text :description, null: false, default: ''
      t.string :language, null: false, default: 'ja_JP'
      t.string :type, null: false, default: 'manga'
      t.text :links, array: true, default: []
      t.datetime :last_updated
      t.text :cover_data

      t.timestamps
    end
  end
end
