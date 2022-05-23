class Empleado < ApplicationRecord
  belongs_to :municipio
  belongs_to :user
end
