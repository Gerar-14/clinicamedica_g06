json.extract! permiso, :id, :nombre_permiso, :ruta, :crud, :created_at, :updated_at
json.url permiso_url(permiso, format: :json)
