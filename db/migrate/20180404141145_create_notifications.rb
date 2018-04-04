class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.boolean :unread, default: true
      t.string :message

      t.timestamps
    end
  end
end
