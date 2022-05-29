class Parametro < ApplicationRecord
  belongs_to :unidad_medida, optional: true
  belongs_to :parametro, optional: true
end
