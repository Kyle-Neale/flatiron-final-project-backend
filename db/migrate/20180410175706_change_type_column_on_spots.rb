class ChangeTypeColumnOnSpots < ActiveRecord::Migration[5.1]
  def change
    rename_column :spots, :type, :spot_type
  end
end
