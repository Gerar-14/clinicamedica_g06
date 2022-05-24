class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.string :nombre,  limit: 100, null: false
      t.references :menu, null: true, foreign_key: true
      t.timestamps
    end
  end
end
