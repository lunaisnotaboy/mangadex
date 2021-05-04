class AddExcludedTagsArrayToUsers < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :excluded_tags, :text, array: true, default: []
  end
end
