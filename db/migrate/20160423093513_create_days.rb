class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :day
      t.integer :phase_id

      t.timestamps null: false
    end
  end
end
