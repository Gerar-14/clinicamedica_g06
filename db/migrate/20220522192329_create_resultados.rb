class CreateResultados < ActiveRecord::Migration[7.0]
  def change
    create_table :resultados do |t|
      t.string :descripcion,  limit: 100, null: false
      t.references :parametro, null: false, foreign_key: true
      t.references :orden, null: false, foreign_key: true

      t.timestamps
    end
  end
end
