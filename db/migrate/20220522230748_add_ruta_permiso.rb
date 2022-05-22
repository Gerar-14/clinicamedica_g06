class AddRutaPermiso < ActiveRecord::Migration[7.0]
  def change
    add_column :permisos, :ruta, :string
  end
end
