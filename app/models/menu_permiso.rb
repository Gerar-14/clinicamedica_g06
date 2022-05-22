class MenuPermiso < ApplicationRecord
  belongs_to :menu
  belongs_to :permiso
end
