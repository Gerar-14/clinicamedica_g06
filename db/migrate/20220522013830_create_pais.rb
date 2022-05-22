class CreatePais < ActiveRecord::Migration[7.0]
  def change
    create_table :pais do |t|
      t.string :nombre_pais

      t.timestamps
    end
  end
end
