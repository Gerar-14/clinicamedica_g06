class CreateTypeExams < ActiveRecord::Migration[7.0]
  def change
    create_table :type_exams do |t|
      t.string :name_type_examn, limit:50, null: false

      t.timestamps
    end
  end
end
