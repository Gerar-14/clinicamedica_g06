class OrdenTipoExamen < ApplicationRecord
  belongs_to :tipo_examen
  belongs_to :orden
end
