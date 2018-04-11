class AddWebsiteToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :website, :string
  end
end
