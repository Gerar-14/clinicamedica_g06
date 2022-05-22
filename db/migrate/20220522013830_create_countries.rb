class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :nombre_country

      t.timestamps
    end
  end
end
