class CreateMuestras < ActiveRecord::Migration[7.0]
  def change
    create_table :muestras do |t|
      t.string :tipo_muestra, limit: 50, null: false
      t.datetime :fecha_entrega_muestra, null: false
      t.references :empleado, null: false, foreign_key: true
      t.references :orden, null: false, foreign_key: true

      t.timestamps
    end
  end
end
