class Ddniquendexoustomers < ActiveRecord::Migration[8.0]
  def change
    add_index :customers, [:name, :phone, :email], unique: true, name: 'unique_customers_index'
  end
end
