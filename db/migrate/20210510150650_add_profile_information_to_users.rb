# frozen_string_literal: true

class AddProfileInformationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :website, :string, null: false, default: ''
    add_column :users, :bio, :text, null: false, default: ''
    add_column :users, :md_at_home, :boolean, null: false, default: false
    add_column :users, :avatar_data, :text
    add_column :users, :view_hentai, :boolean, null: false, default: false
    add_column :users, :notify_when_updated, :boolean, null: false, default: true
    add_column :users, :show_moderated_posts, :boolean, null: false, default: false
    add_column :users, :theme, :string, null: false, default: 'light'
    add_column :users, :excluded_tags, :text, array: true, default: []
    add_column :users, :shown_chapter_langs, :text, array: true, default: ['en_US']
    add_column :users, :nav, :integer, null: true
    add_column :users, :mdh_portlimit, :boolean, null: false, default: false
    add_column :users, :show_unavailable_chpaters, :boolean, null: false, default: false
  end
end
