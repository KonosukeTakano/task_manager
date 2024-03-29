class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :body
      t.datetime :due
      t.integer :status, default: 0
      t.integer :user_id
      t.boolean :reminder_active
      t.timestamps
    end
  end
end
