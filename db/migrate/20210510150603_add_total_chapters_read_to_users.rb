# frozen_string_literal: true

class AddTotalChaptersReadToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :total_chapters_read, :integer, null: false, default: '0'
  end
end
