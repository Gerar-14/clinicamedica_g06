class CreateDepartamentos < ActiveRecord::Migration[7.0]
  def change
    create_table :departamentos do |t|
      t.string :nombre_departamento
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
