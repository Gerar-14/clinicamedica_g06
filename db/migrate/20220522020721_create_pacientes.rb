class CreatePacientes < ActiveRecord::Migration[7.0]
  def change
    create_table :pacientes do |t|
      t.string :nombre_paciente, limit: 50, null: false
      t.string :apellido_paciente, limit: 50, null: false
      t.string :genero_paciente, limit: 1, null: false
      t.date :fecha_nacimiento, null: false
      t.string :direccion, limit: 200, null: false
      t.string :telefono, limit: 20
      t.string :telefono_celular, limit:20, null:false
      t.string :telefono_contacto, limit:20, null:false
      t.string :correo_electronico, limit: 50
      t.string :apellido_casado, limit: 50
      t.string :estado_civil, limit: 1, null: false
      t.string :dui_paciente, limit: 10
      t.string :pasaporte, limit:20
      t.references :municipio, null: false, foreign_key: true
      t.references :tipo_sangre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
