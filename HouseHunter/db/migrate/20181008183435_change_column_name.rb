class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :houses, :images, :image
  end
end
