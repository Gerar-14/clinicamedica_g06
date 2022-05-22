json.extract! paciente, :id, :nombre_paciente, :apellido_paciente, :genero_paciente, :fecha_nacimiento, :direccion, :telefono, :telefono_celular, :telefono_contacto, :correo_electronico, :apellido_casado, :estado_civil, :dui_paciente, :pasaporte, :municipio_id, :tipo_sangre_id, :created_at, :updated_at
json.url paciente_url(paciente, format: :json)
