class CreateRols < ActiveRecord::Migration[7.0]
  def change
    create_table :rols do |t|
      t.string :nombre_rol

      t.timestamps
    end
  end
end
