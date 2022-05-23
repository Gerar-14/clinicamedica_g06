json.extract! empleado, :id, :nombre_empleado, :apellido_empleado, :profesion, :dui_empleado, :municipio_id, :user_id, :created_at, :updated_at
json.url empleado_url(empleado, format: :json)
