class Orden < ApplicationRecord
  belongs_to :paciente
  belongs_to :laboratory_worker
end
