class CreateArea < ActiveRecord::Migration[7.0]
  def change
    create_table :area do |t|
      t.string :nombre_area

      t.timestamps
    end
  end
end
