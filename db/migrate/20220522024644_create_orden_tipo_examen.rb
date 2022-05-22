class CreateOrdenTipoExamen < ActiveRecord::Migration[7.0]
  def change
    create_table :orden_tipo_examen do |t|
      t.references :tipo_examen, null: false, foreign_key: true
      t.references :orden, null: false, foreign_key: true

      t.timestamps
    end
  end
end
