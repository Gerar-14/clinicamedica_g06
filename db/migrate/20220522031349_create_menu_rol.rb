class CreateMenuRol < ActiveRecord::Migration[7.0]
  def change
    create_table :menu_rol do |t|
      t.references :menu, null: false, foreign_key: true
      t.references :rol, null: false, foreign_key: true

      t.timestamps
    end
  end
end
