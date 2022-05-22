class CreateParametros < ActiveRecord::Migration[7.0]
  def change
    create_table :parametros do |t|
      t.string :nombre_parametro
      t.integer :tipo_parametro
      t.references :unidad_medida, null: false, foreign_key: true
      t.references :parametro, null: false, foreign_key: true

      t.timestamps
    end
  end
end
