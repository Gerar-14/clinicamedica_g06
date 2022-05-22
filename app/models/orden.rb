class Orden < ApplicationRecord
  belongs_to :paciente
  belongs_to :laboratorista
end
