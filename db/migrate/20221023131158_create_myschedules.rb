class CreateMyschedules < ActiveRecord::Migration[6.1]
  def change
    create_table :my_schedules do |t|
      t.references :member, foreign_key: true
      t.date :start_date, null: false
      t.boolean :morning_select,        null: false, default: false
      t.boolean :lunch_select,        null: false, default: false
      t.boolean :dinner_select,        null: false, default: false
      t.text :supplement
      t.timestamps
    end
  end
end
