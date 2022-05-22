class Muestra < ApplicationRecord
  belongs_to :empleado
  belongs_to :orden_tipo_examen
end
