class CreateUnidadMedidas < ActiveRecord::Migration[7.0]
  def change
    create_table :unidad_medidas do |t|
      t.string :nombre_unidad_medida,  limit: 50, null: false
      t.string :siglas,  limit: 15, null: false
      t.string :sistema_medida,  limit: 30, null: false
      t.string :descripcion_unidad_medida,  limit: 100, null: false

      t.timestamps
    end
  end
end
