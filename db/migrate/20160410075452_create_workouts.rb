class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.integer :reps
      t.integer :sets
      t.integer :weight
      t.boolean :completed, default: false
      t.integer :day_id

      t.timestamps null: false
    end
  end
end
