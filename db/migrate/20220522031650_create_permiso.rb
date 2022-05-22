class CreatePermiso < ActiveRecord::Migration[7.0]
  def change
    create_table :permiso do |t|
      t.string :nombre_permiso

      t.timestamps
    end
  end
end
