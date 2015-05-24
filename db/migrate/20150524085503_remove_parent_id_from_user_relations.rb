class RemoveParentIdFromUserRelations < ActiveRecord::Migration
  def change
    remove_column :user_relations, :parent_id, :integer
  end
end
