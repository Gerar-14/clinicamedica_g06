class CreateResultado < ActiveRecord::Migration[7.0]
  def change
    create_table :resultado do |t|
      t.string :descripcion
      t.references :parametro, null: false, foreign_key: true
      t.references :orden, null: false, foreign_key: true

      t.timestamps
    end
  end
end
