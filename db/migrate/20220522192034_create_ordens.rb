class CreateOrdens < ActiveRecord::Migration[7.0]
  def change
    create_table :ordens do |t|
      t.datetime :fecha_examen, null:false
      t.references :paciente, null: false, foreign_key: true
      t.references :laboratory_worker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
