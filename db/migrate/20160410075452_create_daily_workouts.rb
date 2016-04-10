class CreateDailyWorkouts < ActiveRecord::Migration
  def change
    create_table :daily_workouts do |t|
      t.string :name
      t.integer :reps
      t.integer :sets
      t.boolean :completed
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
