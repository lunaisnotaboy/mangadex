# frozen_string_literal: true

class AddLastActiveAtToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_active_at, :datetime
  end
end
