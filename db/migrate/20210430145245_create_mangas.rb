# frozen_string_literal: true

class CreateMangas < ActiveRecord::Migration[6.0]
  def change
    create_table :mangas do |t|
      t.string :title, null: false
      t.text :alt_titles, default: ''
      t.text :description, null: false, default: ''
      t.string :artist, default: ''
      t.string :author, null: false, default: ''
      t.string :language, null: false, default: 'ja_JP'
      t.boolean :hentai, null: false, default: false
      t.text :links, array: true, default: []
      t.integer :views, null: false, default: 0
      t.datetime :last_updated
      t.text :cover

      t.timestamps
    end
  end
end
