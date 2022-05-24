class CreateTipoSangres < ActiveRecord::Migration[7.0]
  def change
    create_table :tipo_sangres do |t|
      t.string :nombre_tipo_sangre, limit: 50, null: false

      t.timestamps
    end
  end
end
