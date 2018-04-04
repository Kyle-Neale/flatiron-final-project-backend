class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :name
      t.string :google_uid
      t.text :description
      t.float :lat
      t.float :lng
      t.string :address
      t.string :phone_number

      t.timestamps
    end
  end
end
