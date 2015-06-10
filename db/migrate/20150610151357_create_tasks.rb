class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :body, null: false
      t.belongs_to :list, null: false
      t.timestamps null: false
    end
  end
end
