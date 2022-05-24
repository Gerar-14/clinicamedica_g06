class CreatePermisos < ActiveRecord::Migration[7.0]
  def change
    create_table :permisos do |t|
      t.string :nombre_permiso,  limit: 50, null: false
      t.string :ruta, limit: 200, null: false

      t.timestamps
    end
  end
end
