class CreateValueReferences < ActiveRecord::Migration[7.0]
  def change
    create_table :value_references do |t|
      t.string :value_reference, limit: 30, null: false
      t.references :parametro, null: false, foreign_key: true

      t.timestamps
    end
  end
end
