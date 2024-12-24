class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :status, default: 'Pending'
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
