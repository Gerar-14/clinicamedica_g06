class CreateAreaTypeExams < ActiveRecord::Migration[7.0]
  def change
    create_table :area_type_exams do |t|
      t.references :area, null: false, foreign_key: true
      t.references :type_exam, null: false, foreign_key: true

      t.timestamps
    end
  end
end
