class AddEmailToUserRelation < ActiveRecord::Migration
  def change
    add_column :user_relations, :email, :string
  end
end
