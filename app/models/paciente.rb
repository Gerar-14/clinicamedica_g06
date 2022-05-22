class Paciente < ApplicationRecord
  belongs_to :municipio
  belongs_to :tipo_sangre
end
