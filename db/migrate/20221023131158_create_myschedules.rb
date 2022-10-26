class CreateMyschedules < ActiveRecord::Migration[6.1]
  def change
    create_table :my_schedules do |t|
      t.date :start_date, null: false
      t.string :morning_select
      t.string :lunch_select
      t.string :dinner_select
      t.text :supplement
      t.timestamps
    end
  end
end
