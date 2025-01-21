class CreateAppointments < ActiveRecord::Migration[8.0]
  def change
    create_table :appointments do |t|
      t.references :car, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.datetime :appointment_date
      t.string :status

      t.timestamps
    end
  end
end
