class CreateEmpleados < ActiveRecord::Migration[7.0]
  def change
    create_table :empleados do |t|
      t.string :nombre_empleado
      t.string :apellido_empleado
      t.string :profesion
      t.string :dui_empleado
      t.references :municipio, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
