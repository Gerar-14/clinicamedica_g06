class AddColumnAccesos < ActiveRecord::Migration[7.0]
  def change
    add_column :accesos, :crud, :integer, null: true
  end
end
