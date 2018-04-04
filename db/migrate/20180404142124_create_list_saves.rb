class CreateListSaves < ActiveRecord::Migration[5.1]
  def change
    create_table :list_saves do |t|
      t.integer :save_id
      t.integer :list_id

      t.timestamps
    end
  end
end
