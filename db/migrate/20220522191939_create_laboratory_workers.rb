class CreateLaboratoryWorkers < ActiveRecord::Migration[7.0]
  def change
    create_table :laboratory_workers do |t|
      t.string :num_junta_vigilancia, limit: 50, null: false
      t.references :laboratorio, null: false, foreign_key: true
      t.references :empleado, null: false, foreign_key: true

      t.timestamps
    end
  end
end
