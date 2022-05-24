class CreateParametros < ActiveRecord::Migration[7.0]
  def change
    create_table :parametros do |t|
      t.string :nombre_parametro,  limit: 50, null: false
      t.integer :tipo_parametro, null:false
      t.references :unidad_medida, null: true, foreign_key: true
      t.references :parametro, null: true, foreign_key: true

      t.timestamps
    end
  end
end
