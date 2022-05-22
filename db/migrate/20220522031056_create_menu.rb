class CreateMenu < ActiveRecord::Migration[7.0]
  def change
    create_table :menu do |t|
      t.string :nombre
      t.references :menu, null: false, foreign_key: true

      t.timestamps
    end
  end
end
