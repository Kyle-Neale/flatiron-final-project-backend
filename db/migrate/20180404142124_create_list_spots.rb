class CreateListSpots < ActiveRecord::Migration[5.1]
  def change
    create_table :list_spots do |t|
      t.integer :spot_id
      t.integer :list_id

      t.timestamps
    end
  end
end
