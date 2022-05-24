class CreateMunicipios < ActiveRecord::Migration[7.0]
  def change
    create_table :municipios do |t|
      t.string :nombre_municipio, limit: 50, null: false
      t.references :departamento, null: false, foreign_key: true

      t.timestamps
    end
  end
end
