class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      t.references :group, foreign_key: true
      t.string :title, null: false
      t.text :message, null: false
      t.timestamps
    end
  end
end
