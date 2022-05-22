class CreateOrden < ActiveRecord::Migration[7.0]
  def change
    create_table :orden do |t|
      t.datetime :fecha_examen
      t.references :paciente, null: false, foreign_key: true
      t.references :laboratorista, null: false, foreign_key: true

      t.timestamps
    end
  end
end
