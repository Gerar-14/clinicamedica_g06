class AddColumnOrdens < ActiveRecord::Migration[7.0]
  def change
    add_column :ordens, :estado, :integer, null: false
  end
end
