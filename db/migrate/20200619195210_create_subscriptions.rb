class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_foreign_key :subscriptions, :projects
    add_foreign_key :subscriptions, :users

    add_index :subscriptions, [:project_id, :user_id], :unique => true
  end
end
