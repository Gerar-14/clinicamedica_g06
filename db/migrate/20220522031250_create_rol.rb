class CreateRol < ActiveRecord::Migration[7.0]
  def change
    create_table :rol do |t|
      t.string :nombre_rol

      t.timestamps
    end
  end
end
