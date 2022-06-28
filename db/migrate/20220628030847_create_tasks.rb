class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :body
      t.datetime :due
      t.integer :status

      t.timestamps
    end
  end
end
