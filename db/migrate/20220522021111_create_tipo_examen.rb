class CreateTipoExamen < ActiveRecord::Migration[7.0]
  def change
    create_table :tipo_examen do |t|
      t.string :nombre_tipo_examen

      t.timestamps
    end
  end
end
