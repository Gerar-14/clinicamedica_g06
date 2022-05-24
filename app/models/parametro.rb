class Parametro < ApplicationRecord
  belongs_to :unidad_medida
  belongs_to :parametro, optional: true
end
