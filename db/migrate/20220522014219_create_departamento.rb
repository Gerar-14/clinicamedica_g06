class CreateDepartamento < ActiveRecord::Migration[7.0]
  def change
    create_table :departamento do |t|
      t.string :nombre_departamento
      t.references :pais, null: false, foreign_key: true

      t.timestamps
    end
  end
end
