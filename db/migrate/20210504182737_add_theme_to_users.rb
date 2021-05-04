class AddThemeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :theme, :string, null: false, default: 'light'
  end
end
