class Resultado < ApplicationRecord
  belongs_to :parametro
  belongs_to :orden
end
