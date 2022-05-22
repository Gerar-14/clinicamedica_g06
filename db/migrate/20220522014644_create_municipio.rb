class CreateMunicipio < ActiveRecord::Migration[7.0]
  def change
    create_table :municipio do |t|
      t.string :nombre_municipio
      t.references :departamento, null: false, foreign_key: true

      t.timestamps
    end
  end
end
