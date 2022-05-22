class RolEmpleado < ApplicationRecord
  belongs_to :rol
  belongs_to :empleado
end
