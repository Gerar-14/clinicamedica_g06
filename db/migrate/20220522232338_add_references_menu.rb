class AddReferencesMenu < ActiveRecord::Migration[7.0]
  def change
    #add_reference :menus, null: true, foreign_key: true
    change_column_null(:menus, :menu_id, true)
  end
end
