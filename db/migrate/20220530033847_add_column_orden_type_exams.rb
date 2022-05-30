class AddColumnOrdenTypeExams < ActiveRecord::Migration[7.0]
  def change
    add_column :orden_type_exams, :estado, :integer, null: false, default: 1
  end
end
