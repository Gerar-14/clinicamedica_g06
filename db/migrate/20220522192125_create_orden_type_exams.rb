class CreateOrdenTypeExams < ActiveRecord::Migration[7.0]
  def change
    create_table :orden_type_exams do |t|
      t.references :type_exam, null: false, foreign_key: true
      t.references :orden, null: false, foreign_key: true

      t.timestamps
    end
  end
end
