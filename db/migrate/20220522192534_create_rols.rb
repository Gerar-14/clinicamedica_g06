class CreateRols < ActiveRecord::Migration[7.0]
  def change
    create_table :rols do |t|
      t.string :nombre_rol,  limit: 50, null: false

      t.timestamps
    end
  end
end
