class CreateValorReferencia < ActiveRecord::Migration[7.0]
  def change
    create_table :valor_referencia do |t|
      t.string :valor_referencia,  limit: 30, null: false
      t.references :parametro, null: false, foreign_key: true

      t.timestamps
    end
  end
end
