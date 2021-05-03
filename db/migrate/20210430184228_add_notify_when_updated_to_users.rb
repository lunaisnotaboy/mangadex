# frozen_string_literal: true

class AddNotifyWhenUpdatedToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :notify_when_updated, :boolean, null: false, default: true
  end
end
