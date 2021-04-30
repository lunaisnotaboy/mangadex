class AddPublicRelationsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :public_relations, :boolean, default: false
  end
end
