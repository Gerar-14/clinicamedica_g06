class CreateRolEmpleado < ActiveRecord::Migration[7.0]
  def change
    create_table :rol_empleado do |t|
      t.references :rol, null: false, foreign_key: true
      t.references :empleado, null: false, foreign_key: true

      t.timestamps
    end
  end
end
