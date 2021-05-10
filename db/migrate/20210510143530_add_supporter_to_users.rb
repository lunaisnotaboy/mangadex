# frozen_string_literal: true

class AddSupporterToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :supporter, :boolean, default: false
    add_column :users, :started_supporting_at, :datetime
  end
end
