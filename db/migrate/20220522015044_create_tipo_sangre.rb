class CreateTipoSangre < ActiveRecord::Migration[7.0]
  def change
    create_table :tipo_sangre do |t|
      t.string :nombre_tipo_sangre

      t.timestamps
    end
  end
end
