class Acceso < ApplicationRecord
  belongs_to :rol
  belongs_to :permiso
end
