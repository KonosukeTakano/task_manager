class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :body
      t.datetime :due
      t.integer :status, default: 0
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
