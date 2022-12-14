class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :group_code,              null: false
      t.integer :password, null: false
      t.string :group_name,              null: false
      t.integer :admin_member_id, null: false
      t.timestamps
    end
    add_index :groups, [:group_code], unique: true
  end
end
