class Ddniquendexoars < ActiveRecord::Migration[8.0]
  def change
    add_index :cars, [:license_plate, :brand, :model], unique: true, name: 'unique_license_brand_model'
  end
end
