class CreateAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :areas do |t|
      t.string :nombre_area, limit: 50, null: false

      t.timestamps
    end
  end
end
