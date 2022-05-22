class CreateUnidadMedida < ActiveRecord::Migration[7.0]
  def change
    create_table :unidad_medida do |t|
      t.string :nombre_unidad_medida
      t.string :siglas
      t.string :sistema_medida
      t.string :descripcion_unidad_medida

      t.timestamps
    end
  end
end
