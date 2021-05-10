# frozen_string_literal: true

class AddPublicRelationsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :public_relations, :boolean, null: false, default: false
  end
end
