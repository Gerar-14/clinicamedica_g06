class CreateLaboratorista < ActiveRecord::Migration[7.0]
  def change
    create_table :laboratorista do |t|
      t.string :num_junta_vigilancia
      t.references :laboratorio, null: false, foreign_key: true
      t.references :empleado, null: false, foreign_key: true

      t.timestamps
    end
  end
end
