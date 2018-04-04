class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :save_id
      t.string :text
      t.string :image_url

      t.timestamps
    end
  end
end
