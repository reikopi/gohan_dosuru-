class AddDeletedToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :deleted, :boolean, default: false, null: false
  end
end
