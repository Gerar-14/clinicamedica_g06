class CreateLaboratorios < ActiveRecord::Migration[7.0]
  def change
    create_table :laboratorios do |t|
      t.string :nombre_laboratorio,  limit: 50, null: false
      t.references :municipio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
