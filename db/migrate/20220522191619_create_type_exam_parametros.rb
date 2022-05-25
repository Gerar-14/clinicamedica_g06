class CreateTypeExamParametros < ActiveRecord::Migration[7.0]
  def change
    create_table :type_exam_parametros do |t|
      t.references :parametro, null: false, foreign_key: true
      t.references :type_exam, null: false, foreign_key: true

      t.timestamps
    end
  end
end
