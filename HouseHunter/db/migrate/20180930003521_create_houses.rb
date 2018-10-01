class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.belongs_to :company, foreign_key: true
      t.string :location
      t.integer :square_footage
      t.integer :year_built
      t.string :style
      t.float :price_list
      t.integer :number_of_floors
      t.boolean :basement
      t.string :current_owner
      t.string :contact_info_realtor

      t.timestamps
    end
  end
end
