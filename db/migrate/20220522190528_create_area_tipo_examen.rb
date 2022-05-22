class CreateAreaTipoExamen < ActiveRecord::Migration[7.0]
  def change
    create_table :area_tipo_examen do |t|
      t.references :area, null: false, foreign_key: true
      t.references :tipo_examen, null: false, foreign_key: true

      t.timestamps
    end
  end
end
