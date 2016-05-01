class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name, null: false
      t.integer :reps, null: false
      t.integer :sets, null: false
      t.string :weight, null: false
      t.boolean :completed, default: false
      t.integer :user_id
      t.integer :phase, null: false
      t.integer :rest, null: false
      t.integer :day, null: false
      t.string :note

      t.timestamps null: false
    end
  end
end
