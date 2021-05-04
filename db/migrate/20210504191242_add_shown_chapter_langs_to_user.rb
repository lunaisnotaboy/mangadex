class AddShownChapterLangsToUser < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :shown_chapter_langs, :text, array: true, default: ['en_US']
  end
end
