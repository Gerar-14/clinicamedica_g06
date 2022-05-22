class TipoExamenParametro < ApplicationRecord
  belongs_to :parametro
  belongs_to :tipo_examen
end
