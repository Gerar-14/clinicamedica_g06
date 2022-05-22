class CreatePacientes < ActiveRecord::Migration[7.0]
  def change
    create_table :pacientes do |t|
      t.string :nombre_paciente
      t.string :apellido_paciente
      t.string :genero_paciente
      t.date :fecha_nacimiento
      t.string :direccion
      t.string :telefono
      t.string :telefono_celular
      t.string :telefono_contacto
      t.string :correo_electronico
      t.string :apellido_casado
      t.string :estado_civil
      t.string :dui_paciente
      t.string :pasaporte
      t.references :municipio, null: false, foreign_key: true
      t.references :tipo_sangre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
