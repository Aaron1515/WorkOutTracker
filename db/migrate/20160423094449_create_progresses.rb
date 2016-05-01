class CreateProgresses < ActiveRecord::Migration
  def change
    create_table :progresses do |t|
      t.integer :user_id
      t.integer :measurement_id

      t.timestamps null: false
    end
  end
end
