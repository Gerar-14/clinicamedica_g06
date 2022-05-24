class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :nombre_country, limit: 50, null: false

      t.timestamps
    end
  end
end
