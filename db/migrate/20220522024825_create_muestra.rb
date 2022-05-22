class CreateMuestra < ActiveRecord::Migration[7.0]
  def change
    create_table :muestra do |t|
      t.string :tipo_muestra
      t.datetime :fecha_entrega_muestra
      t.references :empleado, null: false, foreign_key: true
      #t.references :orden_tipo_examen, null: false, foreign_key: true
      t.references :orden, null: false, foreign_key: true

      t.timestamps
    end
  end
end
