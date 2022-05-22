class CreateAccesos < ActiveRecord::Migration[7.0]
  def change
    create_table :accesos do |t|
      t.references :rol, null: false, foreign_key: true
      t.references :permiso, null: false, foreign_key: true

      t.timestamps
    end
  end
end
