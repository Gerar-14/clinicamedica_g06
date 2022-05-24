class CreateEmpleados < ActiveRecord::Migration[7.0]
  def change
    create_table :empleados do |t|
      t.string :nombre_empleado,  limit: 50, null: false
      t.string :apellido_empleado,  limit: 50, null: false
      t.string :profesion,  limit: 50, null: false
      t.string :dui_empleado,  limit: 10, null: false
      t.references :municipio, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
