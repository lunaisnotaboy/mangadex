class CreateChapters < ActiveRecord::Migration[6.0]
  def change
    create_table :chapters do |t|
      t.string :hash
      t.belongs_to :manga, foreign_key: true
      t.integer :volume, null: false, default: 0
      t.integer :chapter, null: false, default: 0
      t.string :title, null: false, default: ''
      t.string :language, null: false, default: 'ja_JP'
      t.belongs_to :users, foreign_key: true

      t.timestamps
    end
  end
end
