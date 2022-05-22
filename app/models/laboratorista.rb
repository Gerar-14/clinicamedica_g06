class Laboratorista < ApplicationRecord
  belongs_to :laboratorio
  belongs_to :empleado
end
