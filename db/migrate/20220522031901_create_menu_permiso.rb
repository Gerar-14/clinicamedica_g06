class CreateMenuPermiso < ActiveRecord::Migration[7.0]
  def change
    create_table :menu_permiso do |t|
      t.references :menu, null: false, foreign_key: true
      t.references :permiso, null: false, foreign_key: true

      t.timestamps
    end
  end
end
