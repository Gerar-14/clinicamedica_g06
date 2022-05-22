class CreateTipoExamenParametro < ActiveRecord::Migration[7.0]
  def change
    create_table :tipo_examen_parametro do |t|
      t.references :parametro, null: false, foreign_key: true
      t.references :tipo_examen, null: false, foreign_key: true

      t.timestamps
    end
  end
end
