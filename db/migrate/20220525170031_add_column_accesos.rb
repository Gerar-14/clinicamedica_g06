class AddColumnAccesos < ActiveRecord::Migration[7.0]
  def change
    add_column :permisos, :crud, :integer, null: true
  end
end
